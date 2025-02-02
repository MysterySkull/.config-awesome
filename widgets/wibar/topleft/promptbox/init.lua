local awful = require('awful')
local naughty = require('naughty')

local ptbox = awful.widget.prompt{
   prompt = "",
   
   done_callback = function()
      awesome.emit_signal("promptbox::ended")
   end,

   changed_callback = function()
      awesome.emit_signal("promptbox::redraw_needed")
   end,
}

return ptbox
