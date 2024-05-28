uiClass = require 'InterfaceClass' -- Allow files to make ui / user interface.
require 'CollisionChecker' --Allow files to use the Check collision function
local PlayerMouse = require 'MouseFile'

local StateFunctions = require 'StateManager' -- State functions from state manager file
local ChangeState = StateFunctions.ChangeState
local StateLoad = StateFunctions.StateLoad
local StateUpdate = StateFunctions.StateUpdate
local StateDraw = StateFunctions.StateDraw


--Load, Update, Draw, State

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

