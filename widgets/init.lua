local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')

local _M = {}

_M.create_screen_widgets = function(s)
   awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])

   require('widgets.wibar').create_wibar(s)
end

return _M
