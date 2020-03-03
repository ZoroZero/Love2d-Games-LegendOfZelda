require 'src/Ultil'

-- WINDOW DIMENSIONS
WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

-- VIRTUAL DIMENSIONS
VIRTUAL_WIDTH = 384;
VIRTUAL_HEIGHT = 216;



-- SOUND
game_Sounds = {
    -- ['death'] = love.audio.newSource('assets/sounds/death.wav', 'static')
}

-- FONT
game_Fonts = {
    ['smallFont'] = love.graphics.newFont('assets/fonts/font.ttf', 8),
    ['mediumFont'] = love.graphics.newFont('assets/fonts/font.ttf', 16),
    ['largeFont'] = love.graphics.newFont('assets/fonts/font.ttf', 24),
    ['titleFont'] = love.graphics.newFont('assets/fonts/zelda.otf', 64),
    ['smallTitleFont'] = love.graphics.newFont('assets/fonts/zelda.otf', 32)
}

-- TEXTURE
game_Textures = {
    ['background'] = love.graphics.newImage('assets/graphics/background.png'),
}


-- GAME FRAMES
game_Frames = {
}
