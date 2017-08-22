--[[
    Frame Class
    ------------
    A Frame is a region in the game Were specific parts will be drawn.
    Its characters will be limited to the tiles of the set, to emulate a console.
    Used for the general layout of the UI.
]]--

Frame = class('Frame')

function Frame:initialize(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height

    self.staging = {}
    self.batch = love.graphics.newSpriteBatch(tilesetImage, 2000)
end

function Frame:addZone(zone)
    self.staging = {}
    for x=1, #zone do
        self.staging[x] = {}
        for y=1, #zone[1] do
            self.staging[x][y] = zone[x][y]
        end
    end
end

function Frame:addEntity(entity)
    self.staging[entity.x][entity.y] = entity
end

function Frame:flush()
    self.batch:clear()
    local initX = 0
    local initY = 0

    if self.width > #self.staging then
        initX = initX + math.floor((self.width - #self.staging)/2)
    end
    if self.height > #self.staging[1] then
        initY = initY + math.floor((self.height - #self.staging[1])/2)
    end

    for x=1, self.width do
        for y=1, self.height do
            if self.staging[x-initX] ~= nil and self.staging[x-initX][y-initY] ~= nil then
                self.batch:setColor(self.staging[x-initX][y-initY].foreground)
                self.batch:add(self.staging[x-initX][y-initY].quad, (x-1)*TILE_WIDTH,(y-1)*TILE_HEIGHT)
            else 
                self.batch:setColor(20, 20, 20)
                self.batch:add(imageLoader:convertInt(177), (x-1)*TILE_WIDTH,(y-1)*TILE_HEIGHT)
            end
        end
    end
    self.batch:flush()
end

function Frame:draw()
    love.graphics.draw(self.batch, TILE_WIDTH*self.x, TILE_HEIGHT*self.y)
end