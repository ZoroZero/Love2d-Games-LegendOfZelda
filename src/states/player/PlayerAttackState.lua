PlayerAttackState = Class {__includes = BaseState}

-- INIT
function PlayerAttackState:init(player, dungeon)
    self.player = player;

    -- change render for space
    self.player.offset_Y = 5;
    self.player.offset_X = 8;

   

    self.dungeon = dungeon

    local hitbox_X, hitbox_Y, hitbox_Width, hitbox_Height

    if self.player.direction == 'left' then 
        hitbox_X = self.player.x - 8;
        hitbox_Y = self.player.y;
        hitbox_Width = 8;
        hitbox_Height = 22;
    elseif self.player.direction == 'right' then 
        hitbox_X = self.player.x + 14;
        hitbox_Y = self.player.y;
        hitbox_Width = 8;
        hitbox_Height = 22;
    elseif self.player.direction == 'up' then 
        hitbox_X = self.player.x;
        hitbox_Y = self.player.y - 4;
        hitbox_Width = 16;
        hitbox_Height = 8;
    else
        hitbox_X = self.player.x;
        hitbox_Y = self.player.y + 19;
        hitbox_Width = 16;
        hitbox_Height = 8;
    end

    self.attack_Hitbox = Hitbox({
        x = hitbox_X,
        y = hitbox_Y,
        width = hitbox_Width,
        height = hitbox_Height
    }) 
    
    self.player:changeAnimation('attack-' .. self.player.direction);
end

-- ENTER FUNCTION
function PlayerAttackState:enter(params)
    self.player.currentAnimation:refresh()
end

-- UPDATE
function PlayerAttackState:update(dt)
    self.player.currentAnimation:update(dt);

    -- check for collision with enemy
    for k, entity in pairs(self.dungeon.current_Room.entities) do 
        if entity:collide(self.attack_Hitbox) then 
            entity:damage(1);
        end
    end

    -- Play animation only one time
    if self.player.currentAnimation.time_Played > 0.2 then 
        self.player.currentAnimation.time_Played = 0;
        self.player:changeState('idle');
    end

    if love.keyboard.wasPressed('space') then 
        self.player:changeState('attack');
    end
end


-- RENDER
function PlayerAttackState:render()
    local ani = self.player.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.player.x - self.player.offset_X), math.floor(self.player.y - self.player.offset_Y)
    );

    -- debug hit box
    love.graphics.setColor(0,1,0,1);
    love.graphics.rectangle('line', self.player.x, self.player.y, self.player.width,self.player.height);
    love.graphics.rectangle('line', self.attack_Hitbox.x, self.attack_Hitbox.y, self.attack_Hitbox.width,self.attack_Hitbox.height);
    love.graphics.setColor(1,1,1,1);
end