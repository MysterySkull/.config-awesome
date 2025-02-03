local awful = require('awful')
local beautiful = require('beautiful')
local naughty = require('naughty')

local ptbox = awful.widget.prompt{
   prompt = '',
   bg = "#00000000",

   done_callback = function()
      awesome.emit_signal("promptbox::ended")
   end,

   changed_callback = function()
      awesome.emit_signal("promptbox::redraw_needed")
   end,
}

return ptbox
