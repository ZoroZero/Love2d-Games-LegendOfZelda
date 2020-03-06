Room = Class {}

-- INIT
function Room:init(player)
    self.player = player;
   
    -- Dimensions
    self.width = MAP_WIDTH;
    self.height = MAP_HEIGHT;

    -- Tiles in the room
    self.tiles = {};
    self:generateWallAndFloor();
    -- Entites in the room
    self.entities = {};
    self:generateEnemy();

    -- Onjects in the room 
    self.objects = {};
    self:generateObject();

    -- doorway
    self.doorways = {}
    table.insert(self.doorways, Doorway('right', false, 1) );
    table.insert(self.doorways, Doorway('top', false, 1) );
    table.insert(self.doorways, Doorway('bottom', false, 1) );
    table.insert(self.doorways, Doorway('left', false, 1) );

    -- NEXT ROOM
    self.next_Room = nil;

    -- DRAWING OFFSET
    self.render_Offset_X = MAP_RENDER_OFFSET_X;
    self.render_Offset_Y = MAP_RENDER_OFFSET_Y;

    -- Offset of adjacent room - Used when change room
    self.adjacent_Offset_X = 0;
    self.adjacent_Offset_Y = 0;

end


-- UPDATE
function Room:update(dt)
    
    for k, doorway in pairs(self.doorways) do 
        doorway:update(dt);
    end

    for k , object in pairs(self.objects) do
        object:update(dt);
        if self.player:collide(object) then 
            object:onCollide();
        end
    end

    for k , entity in pairs(self.entities) do
        entity:processAI({room = 1}, dt);
        entity:update(dt);
        if not entity.is_Dead and entity:collide(self.player) and not self.player.invulnerable then 
            self.player:damage(1);
            self.player:goInvulnerable(1.5);
        end
    end

    self.player:update(dt);
end


-- RENDER
function Room:render()
    for y = 1, self.height do 
        for x = 1, self.width do
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][self.tiles[y][x].id], 
            (x-1)*TILE_SIZE + self.render_Offset_X, (y-1)*TILE_SIZE + self.render_Offset_Y);
        end
    end

    for k, doorway in pairs(self.doorways) do 
        doorway:render(self.adjacent_Offset_X, self.adjacent_Offset_Y);
    end

    for k , object in pairs(self.objects) do
        object:render(self.adjacent_Offset_X, self.adjacent_Offset_Y);
    end

    for k , entity in pairs(self.entities) do
        entity:render(self.adjacent_Offset_X, self.adjacent_Offset_Y)
    end

    love.graphics.stencil(function() 
        -- left
        love.graphics.rectangle('fill',  - TILE_SIZE - 6, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT/2)*TILE_SIZE - TILE_SIZE,
        TILE_SIZE*2 + 6, TILE_SIZE * 2);

        -- right
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH) * TILE_SIZE - 6, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT/2)*TILE_SIZE - TILE_SIZE,
        TILE_SIZE*2 + 6, TILE_SIZE * 2);

        -- top
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH/2)*TILE_SIZE - TILE_SIZE, -TILE_SIZE - 6,
        TILE_SIZE*2, TILE_SIZE * 2 + 6);

        -- bottom
        love.graphics.rectangle('fill', MAP_RENDER_OFFSET_X + (MAP_WIDTH/2)*TILE_SIZE - TILE_SIZE, VIRTUAL_HEIGHT - TILE_SIZE - 6,
        TILE_SIZE*2, TILE_SIZE * 2 + 6);
    
    end,
    'replace', 1)

    love.graphics.setStencilTest('less', 1);

    self.player:render(self.adjacent_Offset_X, self.adjacent_Offset_Y);

    love.graphics.setStencilTest();
end


-- GENERATE THE TILES INSIDE ROOM
function Room:generateWallAndFloor()
    for y = 1, self.height do 

        table.insert( self.tiles, {} );

        for x = 1, self.width do 
            local id = EMPTY_TILE;

            if x == 1 and y == 1 then 
                id = TILE_TOP_LEFT_CORNER;
            elseif x == 1 and y == self.height then 
                id = TILE_BOTTOM_LEFT_CORNER;
            elseif x == self.width and y ==1 then 
                id = TILE_TOP_RIGHT_CORNER;
            elseif x == self.width and y == self.height then 
                id = TILE_BOTTOM_RIGHT_CORNER;
            elseif x == 1 then 
                id = TILE_LEFT_WALLS[math.random(#TILE_LEFT_WALLS)];
            elseif x == self.width then 
                id = TILE_RIGHT_WALLS[math.random(#TILE_RIGHT_WALLS)];
            elseif y == 1 then 
                id = TILE_TOP_WALLS[math.random(#TILE_TOP_WALLS)];
            elseif y == self.height then 
                id = TILE_BOTTOM_WALLS[math.random(#TILE_BOTTOM_WALLS)];
            else 
                id = TILE_FLOORS[math.random(#TILE_FLOORS)];
            end 

            table.insert( self.tiles[y], {id = id} );
        end
    end

end


-- GENERATE ENEMY FUNCTION
function Room:generateEnemy()
    local enemy = {'bat', 'skeleton', 'slime', 'ghost', 'spider'};

    for i = 1, 10 do 
        local enemy_Type = enemy[math.random(#enemy)];

        local enemy = Entity{
            animations = ENTITY_DEF[enemy_Type].animations,

            x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,  MAP_RENDER_OFFSET_X + (MAP_WIDTH - 2) * TILE_SIZE),
            y = math.random(MAP_RENDER_OFFSET_Y+ TILE_SIZE, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 2) * TILE_SIZE),
            
            width = TILE_SIZE,
            height = TILE_SIZE,

            walk_Speed = 20,

            health = 1
        }
        
        table.insert(self.entities, enemy );
        self.entities[i].stateMachine = StateMachine{
            ['idle'] = function () return EntityIdleState(self.entities[i]) end,
            ['walk'] = function () return EntityWalkState(self.entities[i]) end,
        }
        self.entities[i]:changeState('idle');
    end
end



-- GENERATE OBJECTS
function Room:generateObject()
    local switch = GameObject ( GAME_OBJECT_DEFS['switch'], 
    math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,  MAP_RENDER_OFFSET_X + (MAP_WIDTH - 2) * TILE_SIZE),
    math.random(MAP_RENDER_OFFSET_Y+ TILE_SIZE, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 2) * TILE_SIZE)
    );

    table.insert( self.objects, switch )

    switch.onCollide = function ()
        if switch.current_State == 'off' then 
            switch.current_State = 'on'
            for k, doorway in pairs(self.doorways) do 
                doorway.is_Open = true;
            end
        end
    end
end