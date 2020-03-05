PlayState = Class {__includes = BaseState}


-- INIT
function PlayState:init()
    self.player = 1;

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

