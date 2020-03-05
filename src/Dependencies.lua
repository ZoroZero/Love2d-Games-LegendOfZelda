push = require 'lib/push';

Class = require 'lib/class';

Timer = require 'lib/knife.timer'

-- Constants
require 'src/constants'
require 'src/Entity_Defs'
require 'src/Object_Defs'
-- State 
require 'src/StateMachine'

-- Ultility functions
require 'src/Ultil'

-- Animation file
require 'src/Animation'

-- Level generation file

-- Game component
require 'src/Entity'
require 'src/GameObject'

require 'src/Player'
-- Game world
require 'src/world/Room'
require 'src/world/Doorway'
require 'src/world/Dungeon'

-- Game states
require 'src/states/BaseState'

require 'src/states/game/StartState'
require 'src/states/game/PlayState'
require 'src/states/game/GameOverState'


-- Entity state 
require 'src/states/entity/EntityIdleState'
require 'src/states/entity/EntityWalkState'

-- Player state
require 'src/states/player/PlayerIdleState'
require 'src/states/player/PlayerWalkState'

