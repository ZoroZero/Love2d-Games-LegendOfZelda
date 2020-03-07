PlayerWalkState = Class {__includes = EntityWalkState}

-- INIT
function PlayerWalkState:init(player, dungeon)
    self.entity = player;

    self.entity:changeAnimation('walk-' .. self.entity.direction);

    self.dungeon = dungeon;
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

    if love.keyboard.wasPressed('j') then 
        self.entity:changeState('attack');
    end

    -- PLayer moving
    EntityWalkState.update(self, dt);

    if self.bumped then 
        -- Left collision
        if self.entity.direction == 'left' then 
            -- self.entity.x = self.entity.x + self.entity.walk_Speed * dt;
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.y = doorway.y + 4;
                    Event.dispatch('shift-left');
                end
            end
            -- self.entity.x = self.entity.x - self.entity.walk_Speed * dt;

        -- Right collision
        elseif self.entity.direction == 'right' then 
            -- self.entity.x = self.entity.x - self.entity.walk_Speed * dt;
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.y = doorway.y + 4;
                    Event.dispatch('shift-right');
                end
            end
            -- self.entity.x = self.entity.x + self.entity.walk_Speed * dt;

        -- Up collision
        elseif self.entity.direction == 'up' then 
            -- self.entity.y = self.entity.y + self.entity.walk_Speed * dt;
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.x = doorway.x + 8;
                    Event.dispatch('shift-up');
                end
            end
            -- self.entity.y = self.entity.y - self.entity.walk_Speed * dt;

        -- Down collision
        elseif self.entity.direction == 'down' then 
            -- self.entity.y = self.entity.y - self.entity.walk_Speed * dt;
            
            for k, doorway in pairs(self.dungeon.current_Room.doorways) do 
                if self.entity:collide(doorway) and doorway.is_Open then 
                    self.entity.x = doorway.x + 8;
                    Event.dispatch('shift-down');
                end
            end
            -- self.entity.y = self.entity.y + self.entity.walk_Speed * dt;
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