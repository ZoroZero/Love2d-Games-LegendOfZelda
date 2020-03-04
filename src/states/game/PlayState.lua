PlayState = Class {__includes = BaseState}


-- INIT
function PlayState:init()
    self.doorways = {}
    table.insert(self.doorways, Doorway('right', false, 1) );
    table.insert(self.doorways, Doorway('top', false, 1) );
    table.insert(self.doorways, Doorway('bottom', false, 1) );
    table.insert(self.doorways, Doorway('left', false, 1) );
    
end

-- UPDATE
function PlayState:update(dt)
    -- if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
    --     game_State_Machine:change('play');
    -- end
end

-- RENDER
function PlayState:render()
    for k, door in pairs(self.doorways) do 
        door:render();
    end
    
    love.graphics.printf(tostring(MAP_WIDTH) .. ' ' .. tostring(MAP_HEIGHT), 0, 0, VIRTUAL_WIDTH, 'center');
end

