--[[
    ImageLoader class
    -----------------
    Singleton helping class to convert chars to their quad
]]--

ImageLoader = class("ImageLoader")
tilesetImage = love.graphics.newImage(TILESET_PATH)

function ImageLoader:initialize() 
    tilesetImage:setFilter("nearest", "nearest")
    self.quads = {}

    i = 0
    for y=0, (tilesetImage:getHeight() / TILE_HEIGHT) - 1 do
        for x=0, (tilesetImage:getWidth() / TILE_WIDTH) - 1 do
            self.quads[i] = love.graphics.newQuad(x*TILE_WIDTH, y*TILE_HEIGHT,
                    TILE_WIDTH, TILE_HEIGHT, 
                    tilesetImage:getWidth(), tilesetImage:getHeight())
            i = i + 1
        end
    end
    self.quadCount = i
end

function ImageLoader:convertChar(char)
    quad = string.byte(char)
    if quad >= 0 and quad <=  self.quadCount then
        return self.quads[quad]
    else
        print("ERROR: "..char.." has an invalid byte value: "+quad)
    end
end

function ImageLoader:convertInt(int)
    if int >= 0 and int <=  self.quadCount then
        return self.quads[int]
    else
        print("ERROR: "..int.." is an invalid byte value.")
    end
end