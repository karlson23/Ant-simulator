local Interface = {}
Interface.__index = Interface

Interface.new = function(self, stat)
	local self = {}

	self.mode = stat.mode
	self.x = stat.x
	self.y = stat.y 	

	--For offsetting the draw image.
	self.offsetX = stat.offsetX
	self.offsetY = stat.offsetY

	self.width = stat.width 
	self.height = stat.height

	--Information to display.
	self.Information = stat.Information

	return setmetatable(self, Interface)
end
	
Interface.use = function(self)
	
end

Interface.draw = function(self)
	love.graphics.rectangle(self.mode, self.x, self.y, self.width, self.height)
	love.graphics.print(self.Information, self.x + self.offsetX, self.y + self.offsetY)
end

return Interface