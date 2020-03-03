require 'src/Ultil'

-- WINDOW DIMENSIONS
WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

-- VIRTUAL DIMENSIONS
VIRTUAL_WIDTH = 256;
VIRTUAL_HEIGHT = 144;



-- SOUND
game_Sounds = {
    -- ['death'] = love.audio.newSource('assets/sounds/death.wav', 'static')
}

-- FONT
game_Fonts = {
    ['smallFont'] = love.graphics.newFont('assets/fonts/font.ttf', 8),
    ['mediumFont'] = love.graphics.newFont('assets/fonts/font.ttf', 16),
    ['largeFont'] = love.graphics.newFont('assets/fonts/font.ttf', 24),
    ['titleFont'] = love.graphics.newFont('assets/fonts/ArcadeAlternate.ttf', 32)
}

-- TEXTURE
game_Textures = {
    -- ['tile'] = love.graphics.newImage('assets/graphics/tiles.png'),
}


-- GAME FRAMES
game_Frames = {
}
