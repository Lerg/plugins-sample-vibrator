display.setStatusBar(display.HiddenStatusBar)

local widget = require('widget')
local vibrator = require('plugin.vibrator')

--[[
vibrator.hasVibrator()

Returns boolean, true if vibrator is present.


vibrator.vibrate(duration)

Vibrate for a specified duration.

duration - integer, duration in milliseconds.


vibrator.vibrate(pattern, [repeat])

Vibrate with a given pattern.

pattern - table, an array of ints that are the durations for which to turn on or off the vibrator in milliseconds. The first value indicates the number of milliseconds to wait before turning the vibrator on. The next value indicates the number of milliseconds for which to keep the vibrator on before turning it off. Subsequent values alternate between durations in milliseconds to turn the vibrator off or to turn the vibrator on.
repeat - integer, To cause the pattern to repeat, pass the index into the pattern array at which to start the repeat, or -1 to disable repeating.


vibrator.cancel()

Cancel currently ongoing vibration.

]]

display.setDefault('background', 1)

local x, y = display.contentCenterX, display.contentCenterY - 150
local w, h = display.contentWidth * 0.8, 50

widget.newButton{
    x = x, y = y,
    width = w, height = h,
    label = 'Has vibrator?',
    onRelease = function()
        native.showAlert('Has vibrator?', tostring(vibrator.hasVibrator()), {'OK'})
    end}

widget.newButton{
    x = x, y = y + 50,
    width = w, height = h,
    label = 'Vibrate 100',
    onRelease = function()
        vibrator.vibrate(100)
    end}

widget.newButton{
    x = x, y = y + 100,
    width = w, height = h,
    label = 'Vibrate 1000',
    onRelease = function()
        vibrator.vibrate(1000)
    end}

widget.newButton{
    x = x, y = y + 150,
    width = w, height = h,
    label = 'Vibrate 100 500 200 250',
    onRelease = function()
        vibrator.vibrate({100, 500,  200, 250})
    end}

widget.newButton{
    x = x, y = y + 200,
    width = w, height = h,
    label = 'Vibrate 100 500 200 250, 1',
    onRelease = function()
        -- Repeat from index 1 - from the beginning
        vibrator.vibrate({100, 500,  200, 250}, 1)
    end}

widget.newButton{
    x = x, y = y + 250,
    width = w, height = h,
    label = 'Vibrate SOS',
    onRelease = function()
        vibrator.vibrate({0, 100,  100, 100,  100, 100,  200, 300,  100, 300,  100, 300,  200, 100,  100, 100,  100, 100})
    end}

widget.newButton{
    x = x, y = y + 300,
    width = w, height = h,
    label = 'Cancel vibration',
    onRelease = function()
        vibrator.cancel()
    end}
