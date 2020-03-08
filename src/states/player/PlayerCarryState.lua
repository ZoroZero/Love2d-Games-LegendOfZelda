PlayerCarryState = Class {__includes = EntityWalkState}

-- INIT
function PlayerCarryState:init(player, dungeon)
    self.player = player;

    -- change render for space
    self.player.offset_Y = 2;
    self.player.offset_X = 0;
    self.player:changeAnimation('carry-idle-' .. self.player.direction)

    self.dungeon = dungeon

    
end

-- ENTER
function PlayerCarryState:enter(params)
    self.object = params.carry_object;
end

-- UPDATE
function PlayerCarryState:update(dt)

    if love.keyboard.isDown('up') then 
        self.player.direction = 'up';
        self.player:changeAnimation('carry-walk-' .. self.player.direction)

    elseif love.keyboard.isDown('down') then 
        self.player.direction = 'down';
        self.player:changeAnimation('carry-walk-' .. self.player.direction)

    elseif love.keyboard.isDown('left') then 
        self.player.direction = 'left';
        self.player:changeAnimation('carry-walk-' .. self.player.direction)

    elseif love.keyboard.isDown('right') then 
        self.player.direction = 'right';
        self.player:changeAnimation('carry-walk-' .. self.player.direction)

    else 
        self.player:changeAnimation('carry-idle-' .. self.player.direction)
    end

    if love.keyboard.wasPressed('space') then 
        local bullet = Projectile(
            PROJECTILE_DEFS['box'], self.player.direction, self.player.x, math.floor(self.player.y)
        )
        table.insert(self.dungeon.current_Room.projectiles, bullet);
    end
end

-- RENDER
function PlayerCarryState:render()
    local ani = self.player.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.player.x - self.player.offset_X), math.floor(self.player.y - self.player.offset_Y)
    );

    -- Draw carry objects
    self.object:render(0,0);
end