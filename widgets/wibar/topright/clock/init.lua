local wibox = require('wibox')

local _M = wibox.widget {
   {
      {
         format = "%k:%M",
         widget = wibox.widget.textclock,
      },
      {
         format = "%d/%m/%Y",
         widget = wibox.widget.textclock,
      },
      layout = wibox.layout.fixed.vertical
   },
   widget = wibox.container.constraint
}

return _M
