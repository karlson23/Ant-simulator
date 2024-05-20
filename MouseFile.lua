
local MouseClass = require 'MouseClass'
local PlayerMouse = MouseClass:new({
	mode = 'line',

	x = 50,
	y = 50,

	offsetX = 0,
	offsetY = 0,

	width = 15,
	height = 15})


return PlayerMouse

