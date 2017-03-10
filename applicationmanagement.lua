c = require 'config'

-- Fast Application Switching or Launching
local keyToApp = {}
keyToApp['c'] = 'Google Chrome'
keyToApp['s'] = 'Sublime Text'
keyToApp[','] = 'iTerm'
for key, app in pairs(keyToApp) do
    hs.hotkey.bind(c.CmdAltCtrl, key, function() hs.application.launchOrFocus(app) end)
end

-- Show all applications and their short cut hints
hs.hotkey.bind(c.CmdAltCtrl, 'h', function()
    hs.hints.windowHints(getAllValidWindows())
end)

-- utils
function getAllValidWindows ()
    local allWindows = hs.window.allWindows()
    local windows = {}
    local index = 1
    for i = 1, #allWindows do
        local w = allWindows[i]
        if w:screen() then
            windows[index] = w
            index = index + 1
        end
    end
    return windows
end
