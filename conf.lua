--[[
	Basic Configuration File		
]]--
function love.conf(t)
	t.screen = t.screen or t.window     
	--io.stdout:setvbuf("no")
	
	t.screen.width = 1024        
	t.screen.height = 576 

	t.screen.borderless = false  
	t.screen.resizable = false  
	t.screen.fullscreen = false 
	t.screen.vsync = false       
	t.screen.fsaa = 0  
	--t.screen.icon = 0
  end