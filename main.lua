-- Documentation: http://spiralcodestudio.com/plugin-vibrator/
display.setStatusBar(display.HiddenStatusBar)

local widget = require('widget')
local vibrator = require('plugin.vibrator')

display.setDefault('background', 1)

local x, y = display.contentCenterX, display.contentCenterY - 200
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

widget.newButton{
	x = x, y = y + 350,
	width = w, height = h,
	label = 'iOS Haptic',
	onRelease = function()
		local haptic = vibrator.newHaptic()
		if haptic then
			--haptic:prepare() -- prepare decreses invoke() latency
			timer.performWithDelay(500, function()
				-- Call invoke() when you want - right away or after a short delay when action actually happened.
				-- Creating and preparing the haptc object before the actual action improves latency.
				haptic:invoke()
			end)
		end
	end}
