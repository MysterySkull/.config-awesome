local wibox = require('wibox')

local wibar = require('widgets.wibar.floating_wibar')

local clock = require('widgets.wibar.topleft.clock')
local taglist = require('widgets.wibar.topleft.taglist')

local _M = {}

_M.create_top_left_wibar = function(s)

   wibar {
      screen = s,
      widget = wibox.widget {
         clock,
         taglist.create_taglist(s),
         layout = wibox.layout.fixed.horizontal
      }
   }

end

return _M

