PlayerIdleState = Class {__includes = BaseState}


-- INIT
function PlayerIdleState:init(player)
    self.player = player;

    self.player:changeAnimation('idle-' .. self.player.direction)


end


-- UPDATE
function PlayerIdleState:update(dt)
    if love.keyboard.wasPressed('up') then 
        self.player.direction = 'up';
        self.player:changeState('walk');

    elseif love.keyboard.wasPressed('down') then 
        self.player.direction = 'down';
        self.player:changeState('walk');

    elseif love.keyboard.wasPressed('left') then 
        self.player.direction = 'left';
        self.player:changeState('walk');

    elseif love.keyboard.wasPressed('right') then 
        self.player.direction = 'right';
        self.player:changeState('walk');
    end
end

-- RENDER
function PlayerIdleState:render()
    local ani = self.player.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.player.x - self.player.offset_X), math.floor(self.player.y - self.player.offset_Y)
    );
end