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
function Doorway:render(adjacent_Offset_X, adjacent_Offset_Y)
    local x = self.x + adjacent_Offset_X;
    local y = self.y + adjacent_Offset_Y;
    if self.direction == 'top' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][98], x, y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][99], x + TILE_SIZE, y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][117], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][118], x + TILE_SIZE, y);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][134], x, y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][135], x + TILE_SIZE, y - TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][153], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][154], x + TILE_SIZE, y);
        end
    elseif self.direction == 'bottom' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][141], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][142], x + TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][160], x, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][161], x + TILE_SIZE, y + TILE_SIZE);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][216], x, y );
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][217], x + TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][235], x, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][236], x + TILE_SIZE, y + TILE_SIZE);
        end
    elseif self.direction == 'right' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][172], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][173], x + TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][191], x, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][192], x + TILE_SIZE, y + TILE_SIZE);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][174], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][175], x + TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][193], x, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][194], x + TILE_SIZE, y + TILE_SIZE);
        end
    elseif self.direction == 'left' then 
        if self.is_Open then 
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][181], x - TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][182], x, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][200], x - TILE_SIZE, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][201], x, y + TILE_SIZE);
        else
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][219], x - TILE_SIZE, y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][220], x , y);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][238], x - TILE_SIZE, y + TILE_SIZE);
            love.graphics.draw(game_Textures['tiles'], game_Frames['tiles'][239], x, y + TILE_SIZE);
        end
    end

    -- Debug mode only
    -- love.graphics.setColor(1,0,0,1);
    -- love.graphics.rectangle('line', self.x, self.y, self.width, self.height);
    -- love.graphics.setColor(1,1,1,1);
end