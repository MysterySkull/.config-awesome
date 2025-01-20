local wibox = require('wibox')

local wibar = require('widgets.wibar.floating_wibar')

local taglist = require('widgets.wibar.topleft.taglist')
local tasklist = require('widgets.wibar.topleft.tasklist')

local _M = {}

_M.create_top_left_wibar = function(s)

   wibar {
      screen = s,
      widget = wibox.widget {
         taglist.create_taglist(s),
         layout = wibox.layout.fixed.horizontal
      }
   }

end

return _M

