require 'src/Dependencies'

MAP_WIDTH = 200;
MAP_HEIGHT = 10;
-- LOAD FUNCTION
function love.load()
    -- SET UP TEXTURE RENDER OPTIONS
    love.graphics.setDefaultFilter('nearest', 'nearest');

    -- SET UP WINDOW TITLE
    love.window.setTitle('The Legend of Zero');

    -- SET RANDOM SEED
    math.randomseed(os.time());

    -- SET WINDOW SCREEN
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        resizable = true,
        vsyn = true,
        fullscreen = false
    })

    -- SET UP STATE MACHINE
    game_State_Machine = StateMachine {
        ['start'] = function () return StartState() end;

    }

    game_State_Machine:change('start');
    -- SET UP KEY CHECK

    love.keyboard.keysPressed = {};
end


-- UPDATE FUNCTION
function love.update(dt)
    -- Update timer
    Timer.update(dt);

    game_State_Machine:update(dt);

    love.keyboard.keysPressed = {};
end


-- RENDER FUNCTION
function love.draw()
    push:start()

    game_State_Machine:render();
    
    displayFPS();
    
    push:finish()
end


-- RESIZE WINDOW FUNCTION
function love.resize(w, h)
    push:resize(w, h);
end


-- CHECK WHICH KEY WAS PRESSED
function love.keypressed(key)
    love.keyboard.keysPressed[key] = true;
end

-- FUNCTION TO CHECK IF A SPECIFIC KEY WAS PRESSED
function love.keyboard.wasPressed(key)
    return love.keyboard.keysPressed[key];
end

-- DISPLAY FPS FUNCTION
function displayFPS()
    love.graphics.setFont(game_Fonts['smallFont']);
    love.graphics.setColor(255, 255, 0, 255);
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), math.floor(10), 10);
end