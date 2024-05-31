local StateMaker = require 'StateMaker' -- Require the ability to make gamestate.
local TitleScreen = StateMaker:new('TitleScreen') --The games titlescreen.

local TitleScreenUItable = {} -- Table where all ui made for title screen is heldd

--Require Player Mouse from mouseFile.
local PlayerMouse = require 'MouseFile'

TitleScreen.load = function()
	if not StartUI then
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

        StartUI.draw = function()
            love.graphics.rectangle(StartUI.mode, StartUI.x, StartUI.y, StartUI.width, StartUI.height)
            love.graphics.print(StartUI.Information, StartUI.x + StartUI.offsetX, StartUI.y + StartUI.offsetY)
        end


        table.insert(TitleScreenUItable, StartUI)
    end

   

    
end



TitleScreen.update = function(Started)
    Started = false
    for ui_index, ui in ipairs(TitleScreenUItable)  do
        if CheckCollision(ui.x, ui.y, ui.width, ui.height, PlayerMouse.x, PlayerMouse.y, PlayerMouse.width, PlayerMouse.height) and love.mouse.isDown(1) then
            Started = true
        end

        if love.keyboard.isDown(1) then
            Started = false
        end

        return Started
    end
end

TitleScreen.draw =  function()
    for ui_index, ui in ipairs(TitleScreenUItable) do
        if ui.draw then
            ui:draw()
        end
    end
end



return TitleScreen
