PlayerIdleState = Class {__includes = EntityIdleState}


-- INIT
function PlayerIdleState:init(player, dungeon)
    EntityIdleState.init(self, player);
    self.dungeon = dungeon;
    self.object = nil
    self.state = 'idle-'
end

-- ENTER 
function PlayerIdleState:enter(params)
    self.entity.offset_X = 0;
    self.entity.offset_Y = 5;

    self.object = params.carry_object;

    if self.object then 
        self.state = 'carry-idle-';
        self.object.x = self.entity.x + self.object.offset_X;
        self.object.y = self.entity.y - 9;
    end


    self.entity:changeAnimation(self.state .. self.entity.direction);
end

-- UPDATE
function PlayerIdleState:update(dt)
    
    if love.keyboard.isDown('up') then 
        self.entity.direction = 'up';
        self.entity:changeState('walk', {carry_object = self.object});

    elseif love.keyboard.isDown('down') then 
        self.entity.direction = 'down';
        self.entity:changeState('walk', {carry_object = self.object});

    elseif love.keyboard.isDown('left') then 
        self.entity.direction = 'left';
        self.entity:changeState('walk', {carry_object = self.object});

    elseif love.keyboard.isDown('right') then 
        self.entity.direction = 'right';
        self.entity:changeState('walk', {carry_object = self.object});
    end

    if love.keyboard.wasPressed('space') and not self.object then 
        self.entity:changeState('attack');
    end

    self:pickUp()

    if love.keyboard.wasPressed('j') and self.object then 
        local bullet = Projectile(
            PROJECTILE_DEFS['box'], self.entity.direction, self.object.x, self.object.y );
        table.insert(self.dungeon.current_Room.projectiles, bullet);
        self.entity:changeState('idle', {carry_object = nil})
    end
end

-- RENDER
function PlayerIdleState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    );

    if self.object then 
        self.object:render(0, 0);
    end
end


-- PICK UP FUNCTION
function PlayerIdleState:pickUp()
    local pickUp = false; 
    for k, object in pairs(self.dungeon.current_Room.objects) do 
        if not self.entity:collide(object) and object.solid and not pickUp and not self.object then 
            if love.keyboard.wasPressed('k') then 
                self.entity:changeState('idle', {carry_object = object});
                pickUp = true;
                table.remove(self.dungeon.current_Room.objects, k);
            end
        end
    end
end