PlayState = Class {__includes = BaseState}


-- INIT
function PlayState:init()
    self.player = Player {
            animations = ENTITY_DEF['player'].animations,
            walk_Speed = ENTITY_DEF['player'].walk_Speed,
            -- x = math.random(MAP_RENDER_OFFSET_X + TILE_SIZE,  MAP_RENDER_OFFSET_X + (MAP_WIDTH - 2) * TILE_SIZE),
            -- y = math.random(MAP_RENDER_OFFSET_Y+ TILE_SIZE, MAP_RENDER_OFFSET_Y + (MAP_HEIGHT - 2) * TILE_SIZE),
            x = VIRTUAL_WIDTH /2,
            y = VIRTUAL_HEIGHT /2,
            
            width = TILE_SIZE,
            height = 22,

            health = 6,
            offset_Y = 5,
    };
    self.dungeon = Dungeon(self.player);

    self.current_Room = Room(self.player);

    self.player.stateMachine = StateMachine{
        ['idle'] = function () return PlayerIdleState(self.player) end,
        ['walk'] = function () return PlayerWalkState(self.player, self.dungeon) end,
        ['attack'] = function () return PlayerAttackState(self.player, self.dungeon) end
    }
    self.player:changeState('idle');

   
    
end

-- UPDATE
function PlayState:update(dt)
    -- if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
    --     game_State_Machine:change('play');
    -- end
    self.dungeon:update(dt);
end

-- RENDER
function PlayState:render()
    love.graphics.push();
    self.dungeon:render();
    love.graphics.pop();

    -- render health
    
    for i = 1, 3 do
        local heart_frame = 1;
        if self.player.health >= i*2 then 
            heart_frame = 5;
        elseif self.player.health == i*2 - 1 then 
            heart_frame = 3;
        end

        love.graphics.draw(game_Textures['hearts'], game_Frames['hearts'][heart_frame],
        (i - 1) * TILE_SIZE, 0);
    end
end

