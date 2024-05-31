--Require MINIGAME table from MINIGAMETABLE.lua file // where all the minigames are held
local MiniGameTable = require 'MINIGAMETABLE'

local StateMaker = require 'StateMaker' -- Require the ability to make gamestate.
local RunState = StateMaker:new('RunState') --The games titlescreen.


local PickRandomGame = function(Number)
    local Number = love.math.random(#MiniGameTable)
    return Number
end


RunState.load = function(ActiveState)

    if ActiveState == nil then
        return
    end

    --IN 20 min turn off food/

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

return RunState