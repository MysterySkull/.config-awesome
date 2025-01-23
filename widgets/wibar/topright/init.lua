local wibox = require('wibox')

local wibar = require('widgets.wibar.floating_wibar')

local layoutbox = require('widgets.wibar.topright.layoutbox')
local clock = require('widgets.wibar.topright.clock')

local _M = {}

_M.create_system_wibar = function(s)

   wibar {
      screen = s,
      position = 'right',
      widget = wibox.widget {
         clock,
         layoutbox.create_layoutbox(s),
         
         layout = wibox.layout.fixed.horizontal
      }
   }

end

return _M
