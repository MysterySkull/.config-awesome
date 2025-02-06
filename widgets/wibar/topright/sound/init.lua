local awful = require('awful')
local wibox = require('wibox')

local clk_widget = { mt = {} }

local function new(args)

   local sound_icon = "\u{f057e} "
   local volume = awful.widget.watch('bash -c "pulsemixer --get-volume"', 0.5)


   return wibox.widget{
      {
         text = sound_icon,
         widget = wibox.widget.textbox
      },
      volume,
      widget = wibox.layout.fixed.horizontal 
   }
end

function clk_widget.mt:__call(...)
   return new(...)
end

return setmetatable(clk_widget, clk_widget.mt)
