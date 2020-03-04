EntityIdleState = Class{__includes = BaseState}

-- INIT
function EntityIdleState:init( entity )
    self.entity = entity;

    self.entity:changeAnimation('idle-' .. self.entity.direction);
end

-- UPDATE
function EntityIdleState:update(dt)
    -- body
end

-- RENDER
function EntityIdleState:render()
    local ani = self.entity.currentAnimation
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    )
end