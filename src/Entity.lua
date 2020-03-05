Entity = Class {}

-- INIT ENTITY
function Entity:init(params)
    -- Animation
    self.animations = self:createAnimation(params.animations);

    -- Position
    self.x = params.x;
    self.y = params.y;
    self.width = params.width;
    self.height = params.height;

    -- Drawing offset 
    self.offset_X = params.offset_X or 0;
    self.offset_Y = params.offset_Y or 0;

    self.walk_Speed = params.walk_Speed;

    -- Direction
    self.direction = 'down';
    
    -- health
    self.health = params.health;
end


-- UPDATE FUNCTION
function Entity:update(dt)
    self.stateMachine:update(dt);
end


-- CHANGE STATE FUNCTION
function Entity:changeState(name)
    self.stateMachine:change(name)
end


-- RENDER FUNCTION
function Entity:render(adjacent_Offset_X, adjacent_Offset_Y)
    self.x ,self.y = self.x + (adjacent_Offset_X or 0), self.y + (adjacent_Offset_Y or 0);
    self.stateMachine:render();
    self.x ,self.y = self.x - (adjacent_Offset_X or 0), self.y - (adjacent_Offset_Y or 0);
end


-- GENERATE ANIMATION
function Entity:createAnimation(animations)
    local return_Animation = {}

    for k, animation in pairs(animations) do 
        return_Animation[k] = Animation{
            texture = animation.texture or 'entities',
            frames = animation.frames,
            interval = animation.interval
        }
    end

    return return_Animation;
end


-- Change animation
function Entity:changeAnimation(name)
    self.currentAnimation = self.animations[name]
end

-- CHECK COLLISION FUNCTION
function Entity:collide(target)
    return not(self.x > target.x + target.width or self.x + self.width < target.x 
                or self.y > target.y + target.height or self.y + self.height < target.y)
end