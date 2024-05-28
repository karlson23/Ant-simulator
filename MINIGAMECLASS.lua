local minigame = {}
minigame.__index = minigame

minigame.new = function(self, name)
	local self = {}
	self.x = stat.x
	self.y = stat.y 

	self.offsetX = stat.offsetX
	self.offsetY = stat.offsetY

	self.width = stat.width
	self.height = stat.height
	
	self.name = stat.name

	self.won = false
	self.lost = false

	self.IsGame = true
	return setmetatable(self , minigame)
end

minigame.enter = function(self) --anything on entering the state
	--Load things here that need to be run before updating.
	self.won = false -- set self.won and self.lost to false before minigame.run to reset the game when picked again.
	self.lost = false
end

minigame.load = function(self)

end

minigame.run = function(self)
	
end

minigame.draw = function(self)
	
end

minigame.exit = function(self)
	
end

return minigame