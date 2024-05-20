local Mouse = {}
Mouse.__index = Mouse

Mouse.new = function(self, stat)
	local self = {}

	self.mode = stat.mode
	self.x = stat.x 
	self.y = stat.y 


	self.offsetX = stat.offsetX
	self.offsetY = stat.offsetY

	self.width = stat.width
	self.height = stat.height

	return setmetatable(self, Mouse)
end

Mouse.update = function(self, x, y)
	self.x = x
	self.y = y 
end

Mouse.draw = function(self)
	love.graphics.rectangle(self.mode, self.x, self.y , self.width, self.height)
end

return Mouse

