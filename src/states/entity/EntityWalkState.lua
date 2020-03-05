EntityWalkState = Class{__includes = BaseState}

-- INIT
function EntityWalkState:init( entity, dungeon )
    self.entity = entity;

    self.entity:changeAnimation('walk-' .. self.entity.direction);

    self.dungeon = dungeon;
    -- Moving timer 
    self.move_Timer = 0;
    self.move_Duration = 0;
end

-- UPDATE
function EntityWalkState:update(dt)
    self.entity.currentAnimation:update(dt);
    if self.entity.direction == 'up' then 
        self.entity.y = self.entity.y - self.entity.walk_Speed*dt;
    
    elseif self.entity.direction == 'down' then 
        self.entity.y = self.entity.y + self.entity.walk_Speed*dt;
    
    elseif self.entity.direction == 'left' then 
        self.entity.x = self.entity.x - self.entity.walk_Speed*dt;

    elseif self.entity.direction == 'right' then 
        self.entity.x = self.entity.x + self.entity.walk_Speed*dt;
    end
end

-- RENDER
function EntityWalkState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    )
end