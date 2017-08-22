--[[
    Entity Class
    --------------
    Basic parent class for every Entity character/entity in the game
--]]

Entity = class('entity')


-- TODO add background
function Entity:initialize(x, y, quad, foreground)
    self.x = x
    self.y = y
    self.quad = quad
    self.foreground = foreground or DEFAULT_FOREGROUND
    self.background = background or DEFAULT_BACKGROUND

    self.hasForeground = foreground == nil and true or false
    self.hasBackground = background == nil and true or false
end