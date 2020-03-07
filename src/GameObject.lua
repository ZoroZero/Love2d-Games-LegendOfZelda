GameObject = Class{}

-- INIT 
function GameObject:init(params, x, y)
    -- dimensions
    self.x = x;
    self.y = y;
    self.width = params.width;
    self.height = params.height;

    -- State
    self.states = params.states;
    self.default_State = params.default_State;
    self.current_State = self.default_State;

    -- Texture, frame, type
    self.type = params.type;

    self.texture = params.texture;
    self.frame = params.frame or 1;

    self.offset_X = params.offset_X or 0;
    self.offset_Y = params.offset_Y or 0;

    -- Solid or not
    self.solid = params.solid;

    -- on collide default function
    self.onCollide = function () end;
end

-- UPDATE
function GameObject:update(dt)

end

-- RENDER
function GameObject:render(adjacent_Offset_X, adjacent_Offset_Y)
    love.graphics.draw(game_Textures[self.texture], game_Frames[self.texture][self.states[self.current_State].frame or self.frame],
        math.floor(self.x + adjacent_Offset_X - self.offset_X), math.floor(self.y + adjacent_Offset_Y - self.offset_Y))

    -- DEBug mode
    love.graphics.setColor(1,0,0,1);
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1,1,1,1);
end