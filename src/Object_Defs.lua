

-- DATA FOR GAME OBJECT
GAME_OBJECT_DEFS = {
    ['switch'] = {
        width = 16,
        height = 16,
        type = 'switch',
        texture = 'switches',
        frame = 2,
        solid = false,
        states = {
            ['on'] = {
                frame = 1
            },
            ['off'] = {
                frame = 2
            }
        },
        default_State = 'off',
    }

}