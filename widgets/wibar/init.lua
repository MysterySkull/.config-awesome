local awful = require('awful')
local wibox = require('wibox')

local _M = {}

_M.create_wibar = function(s)
   -- Create the wibox
   local wibar = awful.wibar({ position = "top", screen = s })

   -- Add widdgets to the wibar   
   wibar:setup {
      layout = wibox.layout.align.horizontal,
      { -- Left widgets
         layout = wibox.layout.fixed.horizontal,
         require('widgets.wibar.launcher'),
         require('widgets.wibar.taglist').create_taglist(s),
         require('widgets.wibar.promptbox'),
      },
      require('widgets.wibar.tasklist').create_tasklist(s), -- Middle widget
      { -- Right widgets
         layout = wibox.layout.fixed.horizontal,
         require('widgets.wibar.clock'),
         require('widgets.wibar.layoutbox').create_layoutbox(s)
      },
   }

   return wibar
end

return _M
