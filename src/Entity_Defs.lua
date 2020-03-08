ENTITY_DEF = {
    ['player'] = {
        walk_Speed = 30,
        animations = {
            ['idle-up'] = {
                frames = {9},
                interval = 1,
                texture = 'character_walk'
            },
            ['idle-down'] = {
                frames = {1},
                interval = 1,
                texture = 'character_walk'
            },
            ['idle-left'] = {
                frames = {13},
                interval = 1,
                texture = 'character_walk'
            },
            ['idle-right'] = {
                frames = {5},
                interval = 1,
                texture = 'character_walk'
            },
            -- walk
            ['walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.2,
                texture = 'character_walk'
            },
            ['walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.2,
                texture = 'character_walk'
            },
            ['walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.2,
                texture = 'character_walk'
            },
            ['walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.2,
                texture = 'character_walk'
            },
            -- attack
            ['attack-up'] = {
                frames = {5, 6, 7, 8},
                interval = 0.05,
                looping = false,
                texture = 'character_attack'
            },
            ['attack-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.05,
                looping = false,
                texture = 'character_attack'
            },
            ['attack-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.05,
                looping = false,
                texture = 'character_attack'
            },
            ['attack-right'] = {
                frames = {9, 10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character_attack'
            },

            -- pick up
            ['carry-idle-up'] = {
                frames = {9},
                interval = 1,
                texture = 'character_carry'
            },
            ['carry-idle-down'] = {
                frames = {1},
                interval = 1,
                texture = 'character_carry'
            },
            ['carry-idle-left'] = {
                frames = {13},
                interval = 1,
                texture = 'character_carry'
            },
            ['carry-idle-right'] = {
                frames = {5},
                interval = 1,
                texture = 'character_carry'
            },
            -- walk
            ['carry-walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.2,
                texture = 'character_carry'
            },
            ['carry-walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.2,
                texture = 'character_carry'
            },
            ['carry-walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.2,
                texture = 'character_carry'
            },
            ['carry-walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.2,
                texture = 'character_carry'
            },

            -- pick-up animation
            ['pick-up-up'] = {
                frames = {7, 8, 9},
                interval = 0.05,
                looping = false,
                texture = 'character_pickup'
            },
            ['pick-up-down'] = {
                frames = {1, 2, 3},
                interval = 0.05,
                looping = false,
                texture = 'character_pickup'
            },
            ['pick-up-left'] = {
                frames = {10, 11, 12},
                interval = 0.05,
                looping = false,
                texture = 'character_pickup'
            },
            ['pick-up-right'] = {
                frames = {4, 5, 6},
                interval = 0.05,
                looping = false,
                texture = 'character_pickup'
            },
        }
    },
    ['skeleton'] = {
        texture = 'entities',
        width = 12,
        height = 16,
        offset_X = 2,
        offset_Y = 0,
        animations = {
            ['idle-up'] = {
                frames = {47},
                interval = 1
            },
            ['idle-down'] = {
                frames = {11},
                interval = 1
            },
            ['idle-left'] = {
                frames = {23},
                interval = 1
            },
            ['idle-right'] = {
                frames = {35},
                interval = 1
            },
            ['walk-up'] = {
                frames = {46, 47, 48, 46},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {10, 11, 12, 10},
                interval = 0.2
            },
            ['walk-left'] = {
                frames = {22, 23, 24, 22},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {34, 35, 36, 34},
                interval = 0.2
            }
        }
    },
    -- Bat
    ['bat'] = {
        texture = 'entities',
        width = 16,
        height = 10,
        offset_X = 0,
        offset_Y = 1,
        animations = {
            ['idle-up'] = {
                frames = {89},
                interval = 1
            },
            ['idle-down'] = {
                frames = {53},
                interval = 1
            },
            ['idle-left'] = {
                frames = {65},
                interval = 1
            },
            ['idle-right'] = {
                frames = {77},
                interval = 1
            },
            ['walk-up'] = {
                frames = {88, 89, 90, 88},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {52, 53, 54, 52},
                interval = 0.2
            },
            ['walk-left'] = {
                frames = {64, 65, 66, 64},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {76, 77, 78, 76},
                interval = 0.2
            }
        }
    },
    -- slime
    ['slime'] = {
        texture = 'entities',
        width = 16,
        height = 13,
        offset_X = 0,
        offset_Y = 3,
        animations = {
            ['idle-up'] = {
                frames = {86},
                interval = 1
            },
            ['idle-down'] = {
                frames = {50},
                interval = 1
            },
            ['idle-left'] = {
                frames = {62},
                interval = 1
            },
            ['idle-right'] = {
                frames = {74},
                interval = 1
            },
            ['walk-up'] = {
                frames = {85, 86, 87, 85},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {49, 50, 51, 49},
                interval = 0.2
            },
            ['walk-left'] = {
                frames = {61, 62, 63, 61},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {73, 74, 75, 73},
                interval = 0.2
            }
        }
    },
    -- ghost
    ['ghost'] = {
        texture = 'entities',
        width = 16,
        height = 14,
        offset_X = 0,
        offset_Y = 0,
        animations = {
            ['idle-up'] = {
                frames = {92},
                interval = 1
            },
            ['idle-down'] = {
                frames = {56},
                interval = 1
            },
            ['idle-left'] = {
                frames = {68},
                interval = 1
            },
            ['idle-right'] = {
                frames = {80},
                interval = 1
            },
            ['walk-up'] = {
                frames = {91, 92, 93, 91},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {55, 56, 57, 55},
                interval = 0.2
            },
            ['walk-left'] = {
                frames = {67, 68, 69, 67},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {79, 80, 81, 79},
                interval = 0.2
            }
        }
    },
    -- spider
    ['spider'] = {
        texture = 'entities',
        width = 16,
        height = 10,
        offset_X = 0,
        offset_Y = 6,
        animations = {
            ['idle-up'] = {
                frames = {95},
                interval = 1
            },
            ['idle-down'] = {
                frames = {59},
                interval = 1
            },
            ['idle-left'] = {
                frames = {71},
                interval = 1
            },
            ['idle-right'] = {
                frames = {83},
                interval = 1
            },
            ['walk-up'] = {
                frames = {94, 95, 96, 94},
                interval = 0.2
            },
            ['walk-down'] = {
                frames = {58, 59, 60, 58},
                interval = 0.2
            },
            ['walk-left'] = {
                frames = {70, 71, 72, 70},
                interval = 0.2
            },
            ['walk-right'] = {
                frames = {82, 83, 84, 82},
                interval = 0.2
            }
        }
    }
}