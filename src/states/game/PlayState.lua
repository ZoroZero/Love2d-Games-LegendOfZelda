PlayState = Class {__includes = BaseState}


-- INIT
function PlayState:init()
    self.room = Room(1);
    
end

-- UPDATE
function PlayState:update(dt)
    -- if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
    --     game_State_Machine:change('play');
    -- end
    self.room:update(dt);
end

-- RENDER
function PlayState:render()
    self.room:render();
    
    love.graphics.printf(tostring(MAP_WIDTH) .. ' ' .. tostring(MAP_HEIGHT), 0, 0, VIRTUAL_WIDTH, 'center');
end

