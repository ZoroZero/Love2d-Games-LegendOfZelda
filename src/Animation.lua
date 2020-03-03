Animation = Class{}

-- INIT FUNCITON 
function Animation:init( params )
    self.frames = params.frames;
    self.interval = params.interval;
    self.timer = 0;
    self.current_Frame = 1;
end

-- UPDATE FUNCTION
function Animation:update( dt )
    if #self.frames > 1 then 
        self.timer = self.timer + dt;

        if self.timer > self.interval then 
            self.timer = self.timer% self.interval;
            self.current_Frame = math.max(1, (self.current_Frame + 1) % (#self.frames + 1));
        end
    end
end


-- FUNCTION GET CURRENT FRAMES
function Animation:getCurrentFrame( )
    return self.frames[self.current_Frame];
end