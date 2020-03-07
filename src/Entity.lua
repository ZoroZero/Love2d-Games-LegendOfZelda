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

    self.walk_Speed = params.walk_Speed or 20;

    -- Direction
    self.direction = 'down';
    
    -- health
    self.health = params.health;

    -- Invulnerable
    self.invulnerable = false;
    self.invulnerable_Timer = 0;
    self.invulnerable_Duration = 0;
    self.flash_Timer = 0;

    -- Entity dead or not
    self.is_Dead = false;
end


-- UPDATE FUNCTION
function Entity:update(dt)
    -- Update if invulnerable
    if self.invulnerable then 
        self.flash_Timer = self.flash_Timer + dt;
        self.invulnerable_Timer = self.invulnerable_Timer + dt;
        if self.invulnerable_Timer >= self.invulnerable_Duration then
            self.invulnerable = false;
            self.invulnerable_Timer = 0;
            self.invulnerable_Duration = 0;
            self.flash_Timer = 0;
        end
    end

    self.stateMachine:update(dt);
end


-- CHANGE STATE FUNCTION
function Entity:changeState(name)
    self.stateMachine:change(name)
end


-- RENDER FUNCTION
function Entity:render(adjacent_Offset_X, adjacent_Offset_Y)
    -- if invulnerable
    if self.invulnerable and self.flash_Timer > 0.08 then 
        love.graphics.setColor(1,1,1,0);
        self.flash_Timer = 0;
    end
    
    self.x ,self.y = self.x + (adjacent_Offset_X or 0), self.y + (adjacent_Offset_Y or 0);
    self.stateMachine:render();
    -- Check hit box of entity
    love.graphics.setColor(1,0,0,1);
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height);
    love.graphics.setColor(1,1,1,1);
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


-- AI PROCESS
function Entity:processAI(params, dt)
    self.stateMachine:processAI(params, dt);
end


-- Damage entity
function Entity:damage(dam)
    self.health = self.health - dam;
    if self.health == 0 then 
        self.is_Dead = true;
    end
end


-- Go invulnerable
function Entity:goInvulnerable(duration)
    self.invulnerable = true;
    self.invulnerable_Duration = duration;
end
