GameOverState = Class {__includes = BaseState}


-- -- INIT
-- function GameOverState:init()
--     self.map = LevelMaker.generateMap(20, 10);
--     self.background = math.random(1,3)
-- end

-- UPDATE
function GameOverState:update(dt)
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then 
        game_State_Machine:change('play');
    end
end

-- RENDER
function GameOverState:render()
    -- render background
    local BACKGROUND_WIDTH = game_Textures['background']:getWidth();
    local BACKGROUND_HEIGHT = game_Textures['background']:getHeight();

    love.graphics.draw(game_Textures['background'], 
                        0, 0,
                        0, 
                        VIRTUAL_WIDTH /(BACKGROUND_WIDTH -1), VIRTUAL_HEIGHT/ (BACKGROUND_HEIGHT -1));

    
    -- render title
    love.graphics.setFont(game_Fonts['titleFont']);
    drawShadowText("You died", VIRTUAL_HEIGHT/2 - 30);
    love.graphics.setColor(1,0,0,1);
    love.graphics.printf("You died", 0,  VIRTUAL_HEIGHT/2 - 30, VIRTUAL_WIDTH, 'center');

    -- Press enter
    love.graphics.setColor(1,1,1,1);
    love.graphics.setFont(game_Fonts['smallTitleFont']);
    drawShadowText("Press Enter ...", VIRTUAL_HEIGHT/2 + 50);
    love.graphics.printf("Press Enter ...", 2, VIRTUAL_HEIGHT/2 + 50, VIRTUAL_WIDTH, 'center');
end

-- Print shadow function
function drawShadowText(text, y)
    love.graphics.setColor(0, 0, 0, 255);
    love.graphics.printf(text, 2, y + 1, VIRTUAL_WIDTH, 'center');
    love.graphics.printf(text, 1, y + 1, VIRTUAL_WIDTH, 'center');
    love.graphics.printf(text, 0, y + 1, VIRTUAL_WIDTH, 'center');
    love.graphics.printf(text, 1, y + 2, VIRTUAL_WIDTH, 'center');
    love.graphics.setColor(255, 255, 255, 255)
end