Room = Class {}

-- INIT
function Room:init(player)
    self.player = player;
   
    -- Dimensions
    self.width = MAP_WIDTH;
    self.height = MAP_HEIGHT;

    -- Tiles in the room
    self.tiles = {};

    -- Entites in the room
    self.entities = {};

    -- Onjects in the room 
    self.objects = {};

    -- doorway
    self.doorways = {}
    table.insert(self.doorways, Doorway('right', false, 1) );
    table.insert(self.doorways, Doorway('top', false, 1) );
    table.insert(self.doorways, Doorway('bottom', false, 1) );
    table.insert(self.doorways, Doorway('left', false, 1) );

    -- NEXT ROOM
    self.next_Room = nil;
end

-- UPDATE
function Room:update(dt)

end

-- RENDER
function Room:render()

end


-- GENERATE THE TILES INSIDE ROOM
function Room:generateWallAndFloor()
    
end