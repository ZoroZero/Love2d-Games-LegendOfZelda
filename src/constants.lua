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
    ['door'] = love.audio.newSource('assets/sounds/door.wav', 'static'),
    ['hit_enemy'] = love.audio.newSource('assets/sounds/hit_enemy.wav', 'static'),
    ['hit_player'] = love.audio.newSource('assets/sounds/hit_player.wav', 'static'),
    ['music'] = love.audio.newSource('assets/sounds/music.mp3', 'static'),
    ['sword'] = love.audio.newSource('assets/sounds/sword.wav', 'static'),
    ['death'] = love.audio.newSource('assets/sounds/death.wav', 'static'),
    ['pickup'] = love.audio.newSource('assets/sounds/pickup.wav', 'static'),
    ['confirm'] = love.audio.newSource('assets/sounds/confirm.wav', 'static')
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
    ['tiles'] = love.graphics.newImage('assets/graphics/tilesheet.png'),
    ['entities'] = love.graphics.newImage('assets/graphics/entities.png'),
    ['switches'] = love.graphics.newImage('assets/graphics/switches.png'),
    ['character_walk'] = love.graphics.newImage('assets/graphics/character_walk.png'),
    ['hearts'] = love.graphics.newImage('assets/graphics/hearts.png'),
    ['character_attack'] = love.graphics.newImage('assets/graphics/character_swing_sword.png'),
    ['character_carry'] = love.graphics.newImage('assets/graphics/character_pot_walk.png'),
    ['character_pickup'] = love.graphics.newImage('assets/graphics/character_pot_lift.png')
}


-- GAME FRAMES
game_Frames = {
    ['tiles'] = generateQuad(game_Textures['tiles'], TILE_SIZE, TILE_SIZE),
    ['entities'] = generateQuad(game_Textures['entities'], TILE_SIZE, TILE_SIZE),
    ['switches'] = generateQuad(game_Textures['switches'], TILE_SIZE, TILE_SIZE),
    ['character_walk'] = generateQuad(game_Textures['character_walk'], TILE_SIZE, 32),
    ['hearts'] = generateQuad(game_Textures['hearts'], TILE_SIZE, TILE_SIZE),
    ['character_attack'] = generateQuad(game_Textures['character_attack'], 32, 32),
    ['character_carry'] = generateQuad(game_Textures['character_carry'], 16, 32),
    ['character_pickup'] = generateQuad(game_Textures['character_pickup'], 16, 32)
}
