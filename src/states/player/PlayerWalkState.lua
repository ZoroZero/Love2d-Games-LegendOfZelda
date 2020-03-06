PlayerWalkState = Class {__includes = EntityWalkState}

-- INIT
function PlayerWalkState:init(player)
    self.entity = player;

    self.entity:changeAnimation('walk-' .. self.entity.direction);
end


-- UPDATE
function PlayerWalkState:update(dt)
    -- PLayer change direction
    if love.keyboard.isDown('up') then 
        self.entity.direction = 'up';
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    elseif love.keyboard.isDown('down') then 
        self.entity.direction = 'down';
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    elseif love.keyboard.isDown('left') then 
        self.entity.direction = 'left';
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    elseif love.keyboard.isDown('right') then 
        self.entity.direction = 'right';
        self.entity:changeAnimation('walk-' .. self.entity.direction)

    else 
        self.entity:changeState('idle');
    end


    -- PLayer moving
    EntityWalkState.update(self, dt);

    if self.bumped then 
        if self.entity.direction == 'left' then 
            self.entity.x = self.entity.x + self.entity.walk_Speed * dt;

            self.entity.x = self.entity.x - self.entity.walk_Speed * dt;
        end
    end
end 

-- RENDER
function PlayerWalkState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    );
end