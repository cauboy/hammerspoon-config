c = require 'config'

-- Set screen watcher, in case you connect a new monitor, or unplug a monitor
screens = {}
screenArr = {}
local screenwatcher = hs.screen.watcher.new(function()
  screens = hs.screen.allScreens()
end)
screenwatcher:start()

local screenToggle = nil

-- Window Management
hs.hotkey.bind(c.CmdAltCtrl, "left", function() push(0, 0, 0.5, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "right", function() push(0.5, 0, 0.5, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "up", function() push(0, 0, 1, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrl, "down", function() push(0, 0.5, 1, 0.5) end)


hs.hotkey.bind(c.CmdAltCtrlShift, "left", function() push(0, 0, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "3", function() push(0, 0, 0.66, 1) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "4", function() push(0.66, 0, 0.66, 1) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "up", function() push(0.5, 0, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "right", function() push(0.5, 0.5, 0.5, 0.5) end)
hs.hotkey.bind(c.CmdAltCtrlShift, "down", function() push(0, 0.5, 0.5, 0.5) end)

hs.hotkey.bind(c.CmdAltCtrl, "f", function() push(0, 0, 1, 1) end)
hs.hotkey.bind(c.CmdAltCtrl, "m", function() push(0.05, 0.05, 0.9, 0.9) end)

hs.hotkey.bind(c.CmdAltCtrl, "\\", function() moveScreenAndMaximize() end)


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

function moveScreenAndMaximize()
  print(screens)
  print(screenToggle)
  local win = hs.window.focusedWindow()
  if screenToggle then
    win:moveOneScreenWest(0)
    screenToggle = nil
  else
    win:moveOneScreenEast(0)
    screenToggle = 1
  end
end
