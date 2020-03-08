PlayerWalkState = Class {__includes = EntityWalkState}

-- INIT
function PlayerWalkState:init(player, dungeon, room)
    EntityWalkState.init(self, player, dungeon, room);
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

    if love.keyboard.wasPressed('space') then 
        self.entity:changeState('attack');
    end

    if love.keyboard.wasPressed('j') then 
        local bullet = Projectile(
            PROJECTILE_DEFS['box'], self.entity.direction, self.entity.x, math.floor(self.entity.y + self.entity.height/3)
        )
        table.insert(self.dungeon.current_Room.projectiles, bullet);
    end

    -- PLayer moving
    EntityWalkState.update(self, dt);

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
end