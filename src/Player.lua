Player = Class{__includes = Entity}

-- INIT
function Player:init(params)
    Entity.init(self, params);
end

-- UPDATE
function Player:update(dt)
    Entity.update(self, dt);
end


-- RENDER
function Player:render(adjacent_Offset_X, adjacent_Offset_Y)
    Entity.render(self, adjacent_Offset_X, adjacent_Offset_Y);
end

-- CHECK COLLISION
function Player:checkCollision()
    local selfY, self_Height = self.y + self.height/2, self.height/2;
    return not(self.x > target.x + target.width or self.x + self.width < target.x 
            or selfY > target.y + target.height or selfY + self_Height < target.y)
end