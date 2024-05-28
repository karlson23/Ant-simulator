--Require MINIGAME table from MINIGAMETABLE.lua file // where all the minigames are held
local MiniGameTable = require 'MINIGAMETABLE'

--Player health
local Health = 3
local DeathNumber = 0 --number where game ends.
local HealthLimit = 4 --Limit of Health player can have
local SubtractHealth = 1 --Amount to remove player health.

--mini game timer
local Timer = 6
local LastTimer = Timer -- number of timer used for resetting the timer
local TimerLimit = 0 --number when timer ends.
local SubtractTimer = 1 -- Amount to remove from timer.


--Require Interface Table // to put all interface made here into the interface table.
local InterfaceTable = require 'InterfaceTable'
local TitleScreenUItable = {} -- Table where all ui made for title screen is heldd
--Require Player Mouse from mouseFile.
local PlayerMouse = require 'MouseFile'

--Table where the state functions are hold.

--GameState.
local GameStateObject = require 'GameStateClass'

local TitleScreen = GameStateObject:new('TitleScreen')

local RunState = GameStateObject:new('RunState')

--The Active state
local ActiveState = TitleScreen


--TitleScreen Functions
--Put the functions inside the load, update, draw, of the run states that is responsible for running them.


TitleScreen.load = function()

end
--Dont put this in Title screen load because a new start ui will be made everytime titlescreen load gets called
--Start ui for the title screen
local StartUI = uiClass:new({
    mode = 'line',

    x = 10,
    y = 10,

    offsetX = 10,
    offsetY = 5,

    width = 50,
    height = 25,

    Information = 'Start'
})


StartUI.use =  function()
    ActiveState = RunState
end

StartUI.draw = function()
    love.graphics.rectangle(StartUI.mode, StartUI.x, StartUI.y, StartUI.width, StartUI.height)
    love.graphics.print(StartUI.Information, StartUI.x + StartUI.offsetX, StartUI.y + StartUI.offsetY)
end

table.insert(TitleScreenUItable, StartUI)


TitleScreen.update =  function()
   
end

TitleScreen.draw =  function()
    for ui_index, ui in ipairs(TitleScreenUItable) do
        if ui.draw then
            ui:draw()
        end
    end
end


--RunState functions

local PickRandomGame = function(Number)
    local Number = love.math.random(#MiniGameTable)
    return Number
end

RunState.load = function()
    --IN 20 min turn off food/
    Timer = LastTimer
    for minigame_index, minigame in ipairs(MiniGameTable) do
        ActiveState = minigame[PickRandomGame]
    end

    if ActiveState.enter then
        ActiveState:enter()
    end
end

RunState.update = function()
    
end

RunState.draw = function()

end


--Change active State. 



--If active state is nill return
if ActiveState == nil then
    return
end



local ChangeState = function(dt)

    for ui_index, ui in ipairs(TitleScreenUItable)  do
        if ActiveState == TitleScreen then
            if CheckCollision(ui.x, ui.y, ui.width, ui.height, PlayerMouse.x, PlayerMouse.y, PlayerMouse.width, PlayerMouse.height) and love.mouse.isDown(1) then

                if ui.use then
                    ui:use()
                end
            end
        end
    end


    if ActiveState.IsGame then
        Timer = Timer - SubtractTimer * dt

        if Timer < 1 then
            if ActiveState.won then

                ActiveState:exit()
                RunState:load()

         
            elseif ActiveState.lose and Health > DeathNumber then
                ActiveState:exit()
                Health = Health - SubtractHealth
                RunState.load()
                
            elseif ActiveState.lose and Health == DeathNumber then
                ActiveState:exit()
                ActiveState = TitleScreen 
            end
        end
    end

end

local StateLoad = function()
    ActiveState:load()
end 

local StateUpdate = function(dt)
    ActiveState:update()
end

local StateDraw = function()
    ActiveState:draw()
end

local  functionTable = {
    ChangeState = ChangeState,
    StateLoad = StateLoad,
    StateUpdate = StateUpdate,
    StateDraw = StateDraw
}


return functionTable

