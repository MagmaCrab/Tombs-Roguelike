-- Loading Sourcefiles
class = require 'lib.middleclass'

require 'src.constants'
require 'src.imageLoader'
require 'src.frames.frame'
require 'src.entities.entity'


--[[
    Main Game Setup
    ---------------
]]--

function love.load()
    imageLoader = ImageLoader()

    love.window.setTitle(TITLE)

    -- Version Printing
    print('\n'..TITLE..'\nVersion: '..VERSION..'\n-------------')
    print('Using '.._VERSION..' and Love2D.\n')

    local zone={}
    local quad = imageLoader:convertChar(".")
    for x=1,200 do
        zone[x] = {}
        for y=1,20 do
            local gradient = love.math.random(50, 100)
            zone[x][y] = Entity(x, y, quad, {gradient, gradient, gradient})
        end
    end

    local character = Entity(1, 2, imageLoader:convertChar("@"), {200, 40, 100})

 
    -- Frame Setup
    gameFrame = Frame(12, 0, (SCREEN_WIDTH / TILE_WIDTH)-12, (SCREEN_HEIGHT / TILE_HEIGHT))
    gameFrame:addZone(zone)
    gameFrame:addEntity(character)

    gameFrame:flush()
end

function love.draw()
    gameFrame:draw()
end

function love.update(dt)

end