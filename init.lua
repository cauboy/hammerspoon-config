c = require 'config'

require 'windowmanagement'
require 'applicationmanagement'

-- reload hammerspoon config
hs.hotkey.bind(c.CmdAltCtrl, 'escape', function()
    hs.reload()
    hs.alert.show("Config loaded")
end)