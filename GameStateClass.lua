local GameState = {}
GameState.__index = GameState

GameState.new = function(self,mode)
	local self = {}
	self.mode = mode
	self.Run = false


	return setmetatable(self,GameState)
end


GameState.load = function(self)
end

GameState.update = function(self)
end

GameState.draw = function(self)
end

return GameState