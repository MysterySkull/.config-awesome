local awful = require('awful')

local wibar = require('widgets.wibar')

local _M = {}

_M.create_screen_widgets = function(s)
   awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

   wibar.create_wibars(s)
end

return _M
