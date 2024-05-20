require 'CollisionChecker' --Allow files to use the Check collision function
local PlayerMouse = require 'MouseFile'

local StateFunctions = require 'StateManager' -- State functions from state manager file
local ChangeState = StateFunctions[1]
local StateLoad = StateFunctions[2]
local StateUpdate = StateFunctions[3]
local StateDraw = StateFunctions[4]


function love.load()
	StateLoad()
end

function love.update()
	PlayerMouse:update(love.mouse.getX(), love.mouse.getY())
	ChangeState()
	StateUpdate()
end

function love.draw()
	StateDraw()
	PlayerMouse:draw()

end

