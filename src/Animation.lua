Animation = Class{}

-- INIT FUNCITON 
function Animation:init( params )
    self.frames = params.frames;
    self.interval = params.interval;
    self.texture = params.texture;

    self.looping = params.looping or true;
    self.timer = 0;
    self.current_Frame = 1;

    -- check if we have loop through the whole frame array
    self.time_Played = 0;
end

-- REFRESH FUNCTION
function Animation:refresh()
    self.timer = 0;
    self.current_Frame = 1;
    self.time_Played = 0;
end

-- UPDATE FUNCTION
function Animation:update( dt )

    if not self.looping and self.time_Played > 0 then 
        return;
    end

    if #self.frames > 1 then 
        self.timer = self.timer + dt;

        if self.timer > self.interval then 
            self.timer = self.timer% self.interval;
            self.current_Frame = math.max(1, (self.current_Frame + 1) % (#self.frames + 1));

            if self.current_Frame == 1 then 
                self.time_Played = self.time_Played + 1;
            end
        end
    end
end


-- FUNCTION GET CURRENT FRAMES
function Animation:getCurrentFrame( )
    return self.frames[self.current_Frame];
end