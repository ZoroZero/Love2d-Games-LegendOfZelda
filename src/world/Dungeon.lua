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

end

-- UPDATE
function Dungeon:update(dt)
    if not self.shifting then
        self.current_Room:update(dt)
    else
        -- Still update player animation 
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