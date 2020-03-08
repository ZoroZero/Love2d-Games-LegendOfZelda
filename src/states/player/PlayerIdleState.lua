PlayerIdleState = Class {__includes = EntityIdleState}


-- INIT
function PlayerIdleState:init(player, dungeon)
    EntityIdleState.init(self, player);
    self.dungeon = dungeon;
end

-- ENTER 
function PlayerIdleState:enter(params)
    self.entity.offset_X = 0;
    self.entity.offset_Y = 5;
end

-- UPDATE
function PlayerIdleState:update(dt)
    if love.keyboard.isDown('up') then 
        self.entity.direction = 'up';
        self.entity:changeState('walk');

    elseif love.keyboard.isDown('down') then 
        self.entity.direction = 'down';
        self.entity:changeState('walk');

    elseif love.keyboard.isDown('left') then 
        self.entity.direction = 'left';
        self.entity:changeState('walk');

    elseif love.keyboard.isDown('right') then 
        self.entity.direction = 'right';
        self.entity:changeState('walk');
    end

    if love.keyboard.wasPressed('space') then 
        self.entity:changeState('attack');
    end

    if love.keyboard.wasPressed('j') then 
        local bullet = Projectile(
            PROJECTILE_DEFS['box'], self.entity.direction, self.entity.x, math.floor(self.entity.y + self.entity.height/3)
        )
        table.insert(self.dungeon.current_Room.projectiles, bullet);
    end
end

-- RENDER
function PlayerIdleState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    );
end