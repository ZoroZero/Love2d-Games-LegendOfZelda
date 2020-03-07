EntityWalkState = Class{__includes = BaseState}

-- INIT
function EntityWalkState:init( entity, dungeon, objects)
    self.entity = entity;

    self.entity:changeAnimation('walk-' .. self.entity.direction);

    self.dungeon = dungeon;

    self.objects = objects;
    -- Moving timer 
    self.move_Timer = 0;
    self.move_Duration = 0;
    
end

-- UPDATE
function EntityWalkState:update(dt)
    -- update animation
    self.entity.currentAnimation:update(dt);
    
    -- update position
    self.bumped = false;
    
    -- up movement
    if self.entity.direction == 'up' then 
        self.entity.y = self.entity.y - self.entity.walk_Speed*dt;
        if self.entity.y < MAP_RENDER_OFFSET_Y + TILE_SIZE - self.entity.height/2 - 1 or self:checkCollision() then 
            self.entity.y = self.entity.y + self.entity.walk_Speed*dt;
            self.bumped = true;
        end
    -- down movement
    elseif self.entity.direction == 'down' then 
        self.entity.y = self.entity.y + self.entity.walk_Speed*dt;
        if self.entity.y >= MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 3)*TILE_SIZE + self.entity.height/2 or self:checkCollision() then 
            self.entity.y = self.entity.y - self.entity.walk_Speed*dt;
            self.bumped = true;
        end
    -- left movement
    elseif self.entity.direction == 'left' then 
        self.entity.x = self.entity.x - self.entity.walk_Speed*dt;
        if self.entity.x <= MAP_RENDER_OFFSET_X + TILE_SIZE - 1 or self:checkCollision() then 
            self.entity.x = self.entity.x + self.entity.walk_Speed*dt;
            self.bumped = true;
        end
    -- right movement 
    elseif self.entity.direction == 'right' then 
        self.entity.x = self.entity.x + self.entity.walk_Speed*dt;
        if self.entity.x > MAP_RENDER_OFFSET_X + (MAP_WIDTH -2) * TILE_SIZE + 1 or self:checkCollision() then 
            self.entity.x = self.entity.x - self.entity.walk_Speed*dt;
            self.bumped = true;
        end
    end
end

-- RENDER
function EntityWalkState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    )
end

-- ProcessAI
function EntityWalkState:processAI(params, dt)
    self.room = params.room
    local direction = {'left', 'right', 'up', 'down'}

    if self.move_Timer == 0 or self.bumped then 
        self.entity.direction = direction[math.random(#direction)];
        self.entity:changeAnimation('walk-' .. self.entity.direction);
        self.move_Duration = math.random(5);
    elseif self.move_Timer >= self.move_Duration then 
        if math.random(3) == 1 then 
            self.entity:changeState('idle');
        else
            self.entity.direction = direction[math.random(#direction)];
            self.entity:changeAnimation('walk-' .. self.entity.direction);
            self.move_Duration = math.random(5);
            self.move_Timer = self.move_Timer - self.move_Duration;
        end
    end

    self.move_Timer = self.move_Timer + dt;
end

function EntityWalkState:checkCollision()
    for k, object in pairs(self.objects) do 
        if self.entity:collide(object) and object.solid then 
            return true;
        end
    end
    return false
end