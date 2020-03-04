require 'src/Ultil'

-- WINDOW DIMENSIONS
WINDOW_WIDTH = 1280;
WINDOW_HEIGHT = 720;

-- VIRTUAL DIMENSIONS
VIRTUAL_WIDTH = 384
VIRTUAL_HEIGHT = 216;

-- TILE SIZE
TILE_SIZE = 16;

-- MAP DIMENSIONS
MAP_WIDTH = math.floor(VIRTUAL_WIDTH / TILE_SIZE) - 2;
MAP_HEIGHT = math.floor(VIRTUAL_HEIGHT / TILE_SIZE) - 2;

-- RENDER OFFSET
MAP_RENDER_OFFSET_X = (VIRTUAL_WIDTH - MAP_WIDTH * TILE_SIZE) / 2;
MAP_RENDER_OFFSET_Y = (VIRTUAL_HEIGHT - MAP_HEIGHT * TILE_SIZE) / 2;

-- TILE SHEET CONSTANT
TILE_TOP_LEFT_CORNER = 4
TILE_TOP_RIGHT_CORNER = 5
TILE_BOTTOM_LEFT_CORNER = 23
TILE_BOTTOM_RIGHT_CORNER = 24

EMPTY_TILE = 19;

TILE_FLOORS = {
    7, 8, 9, 10, 11, 12, 13,
    26, 27, 28, 29, 30, 31, 32,
    45, 46, 47, 48, 49, 50, 51,
    64, 65, 66, 67, 68, 69, 70,
    88, 89, 107, 108
}

TILE_TOP_WALLS = {58, 59, 60}
TILE_BOTTOM_WALLS = {79, 80, 81}
TILE_LEFT_WALLS = {77, 96, 115}
TILE_RIGHT_WALLS = {78, 97, 116}

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
    ['tiles'] = love.graphics.newImage('assets/graphics/tilesheet.png')
}


-- GAME FRAMES
game_Frames = {
    ['tiles'] = generateQuad(game_Textures['tiles'], TILE_SIZE, TILE_SIZE),
}
