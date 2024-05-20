--Require UI Class
local uiClass = require 'InterfaceClass'

--Require Interface Table // to put all interface made here into the interface table.
local InterfaceTable = require 'InterfaceTable'
local TitleScreenUItable = {} -- Table where all ui made for title screen is heldd
--Require Player Mouse from mouseFile.
local PlayerMouse = require 'MouseFile'

--Table where the state functions are hold.
local functionTable = {}

--GameState.
local GameStateObject = require 'GameStateClass'

local TitleScreen = GameStateObject:new()

local RunState = GameStateObject:new()

--The Active state
local ActiveState = TitleScreen


--TitleScreen Functions
--Put the functions inside the load, update, draw, of the run states that is responsible for running them.

TitleScreen.load = function()
    local StartUI = uiClass:new({
        mode = 'line',

        x = 10,
        y = 10,

        offsetX = 0,
        offsetY = 0,

        width = 25,
        height = 25,

        Information = 'Start'
    })

    StartUI.use =  function()
        ActiveState = RunState
    end
    
    table.insert(TitleScreenUItable, StartUI)
end

TitleScreen.update =  function()
    for ui_index, ui in ipairs(TitleScreenUItable) do
        if CheckCollision(ui.x, ui.y, ui.width, ui.height, PlayerMouse.x, PlayerMouse.y, PlayerMouse.width, PlayerMouse.height) then
            if ui.use then
                ui:use()
            end
        end
    end
end

TitleScreen.draw =  function()
    for ui_index, ui in ipairs(TitleScreenUItable) do
        if ui.draw then
            ui:draw()
        end
    end
end

--RunState functions
RunState.load =  function()
end

RunState.update =  function()
end

RunState.draw =  function()

end


--Change active State. 

ChangeState =  function()

end 



--If active state is nill return
if ActiveState == nil then
    return
end

--Load, Update, Draw, State

local StateLoad = function()
    ActiveState:load()
end 

local StateUpdate = function(dt)
    ActiveState:update()
end

local StateDraw = function()
    ActiveState:draw()
end

table.insert(functionTable, ChangeState)
table.insert(functionTable, StateLoad)
table.insert(functionTable, StateUpdate)
table.insert(functionTable, StateDraw)

return functionTable