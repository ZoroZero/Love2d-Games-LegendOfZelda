Doorway = Class {}

-- INIT
function Doorway:init(direction, is_Open, room)
    self.direction = direction;

    -- Is door open
    self.is_Open = is_Open;

    -- Room that the door is inside
    self.room = room;


    if self.direction == 'top' then 
        self.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH/2)*TILE_SIZE - TILE_SIZE;
        self.y = MAP_RENDER_OFFSET_Y;
        self.width = 32;
        self.height = 16;
    elseif self.direction == 'bottom' then 
        self.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH/2)*TILE_SIZE - TILE_SIZE;
        self.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 1) * TILE_SIZE ;
        self.width = 32;
        self.height = 16;
    elseif self.direction == 'left' then 
        self.x = MAP_RENDER_OFFSET_X;
        self.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT/2)*TILE_SIZE - TILE_SIZE;
        self.width = 16;
        self.height = 32;
    elseif self.direction == 'right' then 
        self.x = MAP_RENDER_OFFSET_X + (MAP_WIDTH - 1) * TILE_SIZE ;
        self.y = MAP_RENDER_OFFSET_Y + (MAP_HEIGHT/2)*TILE_SIZE - TILE_SIZE;
        self.width = 16;
        self.height = 32;
    end
    
end

-- UPDATE
function Doorway:update(dt)

end

-- RENDER
function Doorway:render()
    if self.direction == 'top' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][98], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][99], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][117], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][118], self.x + TILE_SIZE, self.y);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][134], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][135], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][153], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][154], self.x + TILE_SIZE, self.y);
        end
    elseif self.direction == 'bottom' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][141], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][142], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][160], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][161], self.x + TILE_SIZE, self.y);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][216], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][217], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][235], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][236], self.x + TILE_SIZE, self.y);
        end
    elseif self.direction == 'right' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][172], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][173], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][191], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][192], self.x + TILE_SIZE, self.y);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][174], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][175], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][193], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][194], self.x + TILE_SIZE, self.y);
        end
    elseif self.direction == 'left' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][181], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][182], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][200], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][201], self.x + TILE_SIZE, self.y);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][219], self.x, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][220], self.x + TILE_SIZE, self.y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][238], self.x, self.y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][239], self.x + TILE_SIZE, self.y);
        end
    end
end