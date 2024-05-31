local State = {}
State.__index = State

State.new = function(self,name)
	local self = {}
	self.Run = false

	self.name = name
	return setmetatable(self,State)
end


State.enter = function(self) --anything on entering the state
end

State.load = function(self)
	--Load things here that need to be run before updating.
end

State.update = function(self)
end

State.draw = function(self)
end

return State