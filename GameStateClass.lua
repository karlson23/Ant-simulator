local GameState = {}
GameState.__index = GameState

GameState.new = function(self,name)
	local self = {}
	self.Run = false

	self.name = name
	return setmetatable(self,GameState)
end


GameState.load = function(self)
end

GameState.update = function(self)
end

GameState.draw = function(self)
end

return GameState