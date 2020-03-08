PlayerCarryState = Class {__includes = EntityWalkState}

-- INIT
function PlayerCarryState:init(player, dungeon)
    self.player = player;

    -- change render for space
    self.player.offset_Y = 2;
    self.player.offset_X = 0;
    self.player:changeAnimation('pick-up-' .. self.player.direction)

    self.dungeon = dungeon
end

-- ENTER
function PlayerCarryState:enter(params)
    self.object = params.carry_object;
    self.player.currentAnimation:refresh()
    Timer.tween(0.2, {
        [self.object] = {x = self.player.x, y = self.player.y - 9}
    });
    
end

-- UPDATE
function PlayerCarryState:update(dt)
    self.player.currentAnimation:update(dt);

    if self.player.currentAnimation.time_Played > 0.2 then 
        self.player.currentAnimation.time_Played = 0;
        self.player:changeState('idle', {carry_object = self.object});
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