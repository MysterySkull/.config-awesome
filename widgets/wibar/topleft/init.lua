local wibox = require('wibox')
local wibar = require('widgets.wibar.floating_wibar')
local taglist = require('widgets.wibar.topleft.taglist')
local tagbar = require('widgets.wibar.topleft.tagbar')

local _M = {}

_M.create_main_wibar = function(s)

   local mytaglist = taglist.new{
      screen = s
   }

   local taglist_width = taglist.get_width(mytaglist)

   tagbar = tagbar

   wibar {
      screen = s,
      position = 'left',
      width = taglist_width*2,
      widget = wibox.widget {
         mytaglist.taglist,
         tagbar,
         layout = wibox.layout.fixed.horizontal
      }
   }

end

return _M

