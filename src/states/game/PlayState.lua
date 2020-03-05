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

            health = 1,
            offset_Y = 5,
    };

    self.player.stateMachine = StateMachine{
        ['idle'] = function () return PlayerIdleState(self.player) end,
        ['walk'] = function () return PlayerWalkState(self.player) end
    }
    self.player:changeState('idle');

    self.dungeon = Dungeon(self.player);

    self.current_Room = Room(self.player);
    
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
    self.dungeon:render();
    
    love.graphics.printf(tostring(MAP_WIDTH) .. ' ' .. tostring(MAP_HEIGHT), 0, 0, VIRTUAL_WIDTH, 'center');
end

