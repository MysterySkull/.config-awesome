local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local blt_widget = { mt = {} }

local function new()

   local w = wibox.widget{
      widget = wibox.widget.imagebox
   }

   awful.widget.watch('bash -c "~/.config/awesome/widgets/wibar/topright/bluetooth/bluetooth_status.sh"',0.5,
      function(_, stdout)
         if (stdout == "ON\n") then
            w.image = beautiful.bluetooth_icon_on
         elseif (stdout == "CONNECTED\n") then
            w.image = beautiful.bluetooth_icon_conencted
         else
            w.image = beautiful.bluetooth_icon_off
         end
      end)

   return w
end

function blt_widget.mt:__call(...)
   return new(...)
end

return setmetatable(blt_widget, blt_widget.mt)
