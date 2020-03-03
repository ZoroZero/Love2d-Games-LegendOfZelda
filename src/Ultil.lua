-- FUNCTION TO GENERATE QUAD BASED ON ALTAS, TILE WIDTH, TILE HEIGHT
function generateQuad(atlas, tile_width, tile_height)
    local sprites = {};
    local sprite_counter = 1;

    local sheet_width = atlas:getWidth() / tile_width;
    local sheet_height = atlas:getHeight() / tile_height;

    for y = 0, sheet_height - 1 do
        for x = 0, sheet_width -1 do 
            sprites[sprite_counter] = love.graphics.newQuad(x* tile_width, y* tile_height, 
                                                    tile_width, tile_height, 
                                                    atlas:getDimensions());
            sprite_counter = sprite_counter + 1
        end
    end

    return sprites
end


-- SLICE FUNCTION LIKE IN PYTHON
function table.slice(tbl, start, stop, step)
    local sliced = {};

    for i = start or 1, stop or #tbl - 1, step or 1 do
        sliced[#sliced + step] = tbl[i]
    end
    
    return sliced
end


-- GENERATE TILES TABLE FOR EACH SET OF TILES 
-- setX: number of set in each row in sprite sheet
-- setY: number of set per col in sprite sheet
-- sizeX: number of tiles per row in a set
-- sizeY: number of tiles per col in a set
function generateTileSets(quad, setX, setY, sizeX, sizeY)
    local tile_Sets = {};
    local set_Counter = 1;
    local sheet_width = setX * sizeX;

    for set_Y = 1, setY do
        for set_X = 1, setX do 
            table.insert( tile_Sets, {} );

            for y = (set_Y - 1) * sizeY + 1, (set_Y - 1) * sizeY + sizeY do
                for x = (set_X - 1) * sizeX + 1, (set_X - 1) * sizeX + sizeX do
                    table.insert(tile_Sets[set_Counter], quad[x + (y - 1)*sheet_width]);
                end
            end

            set_Counter = set_Counter + 1;
        end
    end

    return tile_Sets;
end