PlayerWalkState = Class {__includes = EntityWalkState}

-- INIT
function PlayerWalkState:init(player, dungeon, objects)
    EntityWalkState.init(self, player, dungeon, objects);
    self.state = 'walk-';
end

-- ENTER
function PlayerWalkState:enter(params)
    self.object = params.carry_object;
        
    if self.object then
        self.state = 'carry-walk-';
    end
end

-- UPDATE
function PlayerWalkState:update(dt)
    -- PLayer change direction
    if love.keyboard.isDown('up') then 
        self.entity.direction = 'up';
        self.entity:changeAnimation(self.state .. self.entity.direction)

    elseif love.keyboard.isDown('down') then 
        self.entity.direction = 'down';
        self.entity:changeAnimation(self.state .. self.entity.direction)

    elseif love.keyboard.isDown('left') then 
        self.entity.direction = 'left';
        self.entity:changeAnimation(self.state .. self.entity.direction)

    elseif love.keyboard.isDown('right') then 
        self.entity.direction = 'right';
        self.entity:changeAnimation(self.state .. self.entity.direction)

    else 
        self.entity:changeState('idle', {carry_object = self.object});
    end

    if love.keyboard.wasPressed('space') then 
        self.entity:changeState('attack');
    end

    if love.keyboard.wasPressed('j') and self.object then 
        local bullet = Projectile(
            PROJECTILE_DEFS['box'], self.entity.direction, self.object.x, self.object.y );
        table.insert(self.dungeon.current_Room.projectiles, bullet);
        self.entity:changeState('idle', {carry_object = nil})
    end
    
    self:pickUp();

    -- PLayer moving
    EntityWalkState.update(self, dt);

    if self.object then 
        self.object.x = self.entity.x + self.object.offset_X;
        self.object.y = self.entity.y - 9;
    end

    if self.bumped then 
        -- Left collision
        if self.entity.direction == 'left' then 
            -- Check doorway collision
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.y = doorway.y + 4;
                    Event.dispatch('shift-left');
                end
            end

        -- Right collision
        elseif self.entity.direction == 'right' then 
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.y = doorway.y + 4;
                    Event.dispatch('shift-right');
                end
            end

        -- Up collision
        elseif self.entity.direction == 'up' then 
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.x = doorway.x + 8;
                    Event.dispatch('shift-up');
                end
            end

        -- Down collision
        elseif self.entity.direction == 'down' then 
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.x = doorway.x + 8;
                    Event.dispatch('shift-down');
                end
            end
        end

    end

    
end 

-- RENDER
function PlayerWalkState:render()
    local ani = self.entity.currentAnimation;
    love.graphics.draw(game_Textures[ani.texture], game_Frames[ani.texture][ani:getCurrentFrame()],
        math.floor(self.entity.x - self.entity.offset_X), math.floor(self.entity.y - self.entity.offset_Y)
    );

    if self.object then 
        self.object:render(0, 0);
    end
end


-- PICK UP FUNCTION
function PlayerWalkState:pickUp()
    local pickUp = false; 
    -- Change position to check for collision
    if self.entity.direction == 'left' then 
        self.entity.x = self.entity.x - 1;
    elseif self.entity.direction == 'right' then 
        self.entity.x = self.entity.x + 1;
    elseif self.entity.direction == 'up' then 
        self.entity.y = self.entity.y - 1;
    elseif self.entity.direction == 'down' then 
        self.entity.y = self.entity.y + 1;
    end

    -- Check for block collision
    for k, object in pairs(self.objects) do 
        if self.entity:collide(object) and object.solid and not pickUp and not self.object then 
            if love.keyboard.wasPressed('k') then 
                self.entity:changeState('carry', {carry_object = object});
                pickUp = true;
                table.remove(self.objects, k);
            end
        end
    end

    -- re-adjust the position
    if self.entity.direction == 'left' then 
        self.entity.x = self.entity.x + 1;
    elseif self.entity.direction == 'right' then 
        self.entity.x = self.entity.x - 1;
    elseif self.entity.direction == 'up' then 
        self.entity.y = self.entity.y + 1;
    elseif self.entity.direction == 'down' then 
        self.entity.y = self.entity.y - 1;
    end
end