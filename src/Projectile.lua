Projectile = Class{}

function Projectile:init(params, direction, x, y)
    self.x = x;
    self.y = y;

    self.width = params.width;
    self.height = params.height;
    self.speed = params.speed;
    self.direction = direction;

    self.texture = params.texture;
    self.frame = params.frame;

    self.move_Distance = 0;
end

function Projectile:update(dt)
    if self.direction == 'up' then 
        self.y = self.y - self.speed*dt;
        if self.y < MAP_RENDER_OFFSET_Y + TILE_SIZE then 
            self.y = self.y + self.speed*dt;
        end

    elseif self.direction == 'down' then 
        self.y = self.y + self.speed*dt;
        if self.y > MAP_RENDER_OFFSET_Y + (MAP_HEIGHT- 2)*TILE_SIZE then 
            self.y = self.y - self.speed*dt;
        end

    elseif self.direction == 'left' then 
        self.x = self.x - self.speed*dt;
        if self.x < MAP_RENDER_OFFSET_X + TILE_SIZE then 
            self.x = self.x + self.speed*dt;
        end

    elseif self.direction == 'right' then 
        self.x = self.x + self.speed*dt;
        if self.x > MAP_RENDER_OFFSET_X + (MAP_WIDTH - 2)*TILE_SIZE then 
            self.x = self.x - self.speed*dt;
        end
    end

    self.move_Distance = self.move_Distance + self.speed*dt;
end

function Projectile:render(adjacent_Offset_X, adjacent_Offset_Y)
    love.graphics.draw(game_Textures[self.texture], game_Frames[self.texture][self.frame],
        math.floor(self.x + adjacent_Offset_X), math.floor(self.y + adjacent_Offset_Y));
end