c = require 'config'

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screens = {}
screenArr = {}
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
end)
screenwatcher:start()

-- Window Management
hs.hotkey.bind(c.CmdAltCtrl, "left", function() push(0, 0, 0.5, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "right", function() push(0.5, 0, 0.5, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "up", function() push(0, 0, 1, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrl, "down", function() push(0, 0.5, 1, 0.5) end)


hs.hotkey.bind(c.CmdAltCtrlShift, "left", function() push(0, 0, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "up", function() push(0.5, 0, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "right", function() push(0.5, 0.5, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "down", function() push(0, 0.5, 0.5, 0.5) end)

hs.hotkey.bind(c.CmdAltCtrl, "f", function() push(0, 0, 1, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "m", function() push(0.05, 0.05, 0.9, 0.9) end)


function push( x, y, w, h )
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + max.w * x
    f.y = max.y + max.h * y
    f.w = max.w * w
    f.h = max.h * h
    win:setFrame(f)
end
