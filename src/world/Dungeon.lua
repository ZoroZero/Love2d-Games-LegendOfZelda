Dungeon = Class {}

-- INIT
function Dungeon:init(player)
    -- rooms
    self.rooms = {};

    -- player
    self.player = player;

    -- current room
    self.current_Room = Room(player);

    -- next room
    self.next_Room = nil;

    -- Camera
    self.camera_X = 0;
    self.camera_Y = 0;
    
    -- If shifting room
    self.shifting = false;

    -- Events for shifting the room
    Event.on('shift-left', function() 
        self:beginShifting(-VIRTUAL_WIDTH, 0);
    end);

    Event.on('shift-right', function() 
        self:beginShifting(VIRTUAL_WIDTH, 0);
    end);

    Event.on('shift-up', function() 
        self:beginShifting(0, -VIRTUAL_HEIGHT);
    end);

    Event.on('shift-down', function() 
        self:beginShifting(0, VIRTUAL_HEIGHT)
    end);

end

-- UPDATE
function Dungeon:update(dt)
    if not self.shifting then
        self.current_Room:update(dt)
    else
        -- Still update player animation 
        self.player.currentAnimation:update(dt)
    end
end

-- RENDER
function Dungeon:render()
    if self.shifting then 
        love.graphics.translate(-self.camera_X, - self.camera_Y);
    end

    self.current_Room:render();

    if self.next_Room then 
        self.next_Room:render();
    end
end


-- BEGIN SHIFTING FUNCTION
function Dungeon:beginShifting(shifting_X, shifting_Y)
    self.shifting = true;

    self.next_Room = Room(self.player);

    for k,doorway in pairs(self.next_Room.doorways) do 
        doorway.is_Open = true;
    end

    self.next_Room.adjacent_Offset_X = shifting_X;
    self.next_Room.adjacent_Offset_Y = shifting_Y;

    local player_X, player_Y = self.player.x, self.player.y;
    if shifting_X < 0 then 
        player_X = -VIRTUAL_WIDTH + (MAP_RENDER_OFFSET_X + (MAP_WIDTH - 1)*TILE_SIZE - self.player.width);
    elseif shifting_X > 0 then 
        player_X = VIRTUAL_WIDTH + MAP_RENDER_OFFSET_X + TILE_SIZE;
    elseif shifting_Y < 0 then 
        player_Y = - VIRTUAL_HEIGHT + (MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 1)*TILE_SIZE + self.player.height);
    else 
        player_Y = VIRTUAL_HEIGHT + MAP_RENDER_OFFSET_Y + self.player.height/2;
    end

    Timer.tween(1, {
        [self] = {camera_X = shifting_X, camera_Y = shifting_Y},
        [self.player] = {x = player_X, y = player_Y}
    }):finish(function()
        self:finishShifting();


        if shifting_X < 0 then 
            self.player.x = (MAP_RENDER_OFFSET_X + (MAP_WIDTH - 1)*TILE_SIZE - self.player.width);
            self.player.direction = 'left';

        elseif shifting_X > 0 then 
            self.player.x = MAP_RENDER_OFFSET_X + TILE_SIZE;
            self.player.direction = 'right';

        elseif shifting_Y < 0 then 
            self.player.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 1) * TILE_SIZE - self.player.height;
            self.player.direction = 'up';

        else 
            self.player.y = MAP_RENDER_OFFSET_Y + self.player.height/2;
            self.player.direction = 'down';
        end

        for k,doorway in pairs(self.current_Room.doorways) do 
            doorway.is_Open = false;
        end

        game_Sounds['door']:play()
    end
    )

    

end


-- FINISH SHIFTING FUNCTION
function Dungeon:finishShifting()
    self.shifting = false;
    self.camera_X = 0;
    self.camera_Y = 0;

    self.current_Room = self.next_Room;
    self.next_Room = nil;
    self.current_Room.adjacent_Offset_X = 0;
    self.current_Room.adjacent_Offset_Y = 0;
end