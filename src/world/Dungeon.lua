Dungeon = Class {}

-- INIT
function Dungeon:init(player)
    -- rooms
    self.rooms = {};

    -- player
    self.player = player;

    -- current room
    self.current_Room = Room(player);



end

-- UPDATE
function Dungeon:update(dt)

end

-- RENDER
function Dungeon:render()

end