PlayerWalkState = Class {__includes = BaseState}

-- INIT
function PlayerWalkState:init(player)
    self.player = player;

    self.player:changeAnimation('walk-' .. self.player.direction);
end


-- UPDATE
function PlayerWalkState:update(dt)
    -- Update animation
    self.player.currentAnimation:update(dt);

    -- PLayer change direction
    if love.keyboard.isDown('up') then 
        self.player.direction = 'up';
        self.player:changeAnimation('walk-' .. self.player.direction)

    elseif love.keyboard.isDown('down') then 
        self.player.direction = 'down';
        self.player:changeAnimation('walk-' .. self.player.direction)

    elseif love.keyboard.isDown('left') then 
        self.player.direction = 'left';
        self.player:changeAnimation('walk-' .. self.player.direction)

    elseif love.keyboard.isDown('right') then 
        self.player.direction = 'right';
        self.player:changeAnimation('walk-' .. self.player.direction)

    else 
        self.player:changeState('idle');
    end

    -- PLayer moving
    if self.player.direction == 'left' then 
        self.player.x = self.player.x - self.player.walk_Speed*dt;

    elseif self.player.direction == 'right' then 
        self.player.x = self.player.x + self.player.walk_Speed*dt;

    elseif self.player.direction == 'up' then 
        self.player.y = self.player.y - self.player.walk_Speed*dt;

    elseif self.player.direction == 'down' then 
        self.player.y = self.player.y + self.player.walk_Speed*dt;
    end
end

-- RENDER
function PlayerWalkState:render()
    local ani = self.player.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.player.x - self.player.offset_X), math.floor(self.player.y - self.player.offset_Y)
    );
end