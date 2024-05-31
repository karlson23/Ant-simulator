

--Game stats
local GameStat = require 'Gamefiles'
--Player HP
local current_hp = GameStat.current_hp -- Player current hp.
local HealthLimit = GameStat.HealthLimit --Limit of current_hp player can have.
local damageHealth = GameStat.damageHealth--Amount to remove player current_hp.
local DeathNumber = GameStat.DeathNumber --number where game ends.

--mini game current_Time
local current_Time = GameStat.current_Time
local LastTimer = GameStat.LastTimer -- number of current_Time used for resetting the current_Time
local TimerEnd = GameStat.TimerEnd--number when current_Time ends.
local SubtractTimer = GameStat.SubtractTimer -- Amount to remove from current_Time.

--

--Require Interface Table // to put all interface made here into the interface table.
local InterfaceTable = require 'InterfaceTable'
--Require Player Mouse from mouseFile.
local PlayerMouse = require 'MouseFile'

--Table where the state functions are hold.

--GameState.

--The Active state
local ActiveState = TitleScreen

--Title screen.
local TitleScreen = require 'TitlescreenFunctions'

--Run state.
local RunState = require 'RunstateFunctions'






--Put the functions inside the load, update, draw, of the run states that is responsible for running them.


ActiveState = TitleScreen



--Change active State. 



--If active state is nill return
if ActiveState == nil then
    return
end


local ChangeState = function(dt)

 
    if ActiveState == TitleScreen then --If title screen pass in active state and the runstate.
        ActiveState:update()

        if ActiveState:update(Started == true) then --If title screen clicked start button
            ActiveState = RunState
        end


    end

    print(ActiveState.name)

    if ActiveState == RunState then --if runstate give runstate:load the activestate
        RunState:load(ActiveState)
    end



    if ActiveState.IsGame then

        current_Time = current_Time - SubtractTimer * dt / 2

        if current_Time <= TimerEnd then
            if ActiveState.won then
                ActiveState:exit()
                RunState:load(ActiveState)
                current_Time = LastTimer

         
            elseif ActiveState.lose and current_hp > DeathNumber then
                ActiveState:exit()
                current_hp = current_hp - damageHealth
                RunState.load(ActiveState)
                current_Time = LastTimer
                
            elseif ActiveState.lose and current_hp == DeathNumber then
                ActiveState:exit()
                ActiveState = TitleScreen
                current_Time = LastTimer
            end
        end
    end

end

local StateLoad = function()
    ActiveState:load()
    ActiveState:enter()
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

