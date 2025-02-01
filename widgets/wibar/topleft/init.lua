local tb = require('widgets.wibar.topleft.tagbar')
local wibar = require('widgets.wibar.floating_wibar')
local wibox = require('wibox')

require('widgets.wibar.topleft.tagbar.signals')

local _M = {}

_M.create_main_wibar = function(s)

   local tagbar = tb()

   wibar {
      screen = s,
      position = 'left',
      width = tb.get_width() + 30, --TODO: mettre en soft la largeur de la wibox
      widget = wibox.widget{
         tagbar,
         layout = wibox.layout.fixed.horizontal
      }
   }
end

return _M

