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
            ['walk-up'] = {
                frames = {9, 10, 11, 12},
                interval = 0.1,
                texture = 'character_walk'
            },
            ['walk-down'] = {
                frames = {1, 2, 3, 4},
                interval = 0.1,
                texture = 'character_walk'
            },
            ['walk-left'] = {
                frames = {13, 14, 15, 16},
                interval = 0.1,
                texture = 'character_walk'
            },
            ['walk-right'] = {
                frames = {5, 6, 7, 8},
                interval = 0.1,
                texture = 'character_walk'
            }
        }
    },
    ['skeleton'] = {
        texture = 'entities',
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
                interval = 0.1
            },
            ['walk-down'] = {
                frames = {10, 11, 12, 10},
                interval = 0.1
            },
            ['walk-left'] = {
                frames = {22, 23, 24, 22},
                interval = 0.1
            },
            ['walk-right'] = {
                frames = {34, 35, 36, 34},
                interval = 0.1
            }
        }
    },
    -- Bat
    ['bat'] = {
        texture = 'entities',
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
                interval = 0.1
            },
            ['walk-down'] = {
                frames = {52, 53, 54, 52},
                interval = 0.1
            },
            ['walk-left'] = {
                frames = {64, 65, 66, 64},
                interval = 0.1
            },
            ['walk-right'] = {
                frames = {76, 77, 78, 76},
                interval = 0.1
            }
        }
    },
    -- slime
    ['slime'] = {
        texture = 'entities',
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
                interval = 0.1
            },
            ['walk-down'] = {
                frames = {49, 50, 51, 49},
                interval = 0.1
            },
            ['walk-left'] = {
                frames = {61, 62, 63, 61},
                interval = 0.1
            },
            ['walk-right'] = {
                frames = {73, 74, 75, 73},
                interval = 0.1
            }
        }
    },
    -- ghost
    ['ghost'] = {
        texture = 'entities',
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
                interval = 0.1
            },
            ['walk-down'] = {
                frames = {55, 56, 57, 55},
                interval = 0.1
            },
            ['walk-left'] = {
                frames = {67, 68, 69, 67},
                interval = 0.1
            },
            ['walk-right'] = {
                frames = {79, 80, 81, 79},
                interval = 0.1
            }
        }
    },
    -- spider
    ['spider'] = {
        texture = 'entities',
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
                interval = 0.1
            },
            ['walk-down'] = {
                frames = {58, 59, 60, 58},
                interval = 0.1
            },
            ['walk-left'] = {
                frames = {70, 71, 72, 70},
                interval = 0.1
            },
            ['walk-right'] = {
                frames = {82, 83, 84, 82},
                interval = 0.1
            }
        }
    }
}