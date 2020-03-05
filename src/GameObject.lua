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
        self.x + adjacent_Offset_X, self.y + adjacent_Offset_Y)
end