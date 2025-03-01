local beautiful = require('beautiful')
local wibox = require('wibox')

local bth_widget = require('widgets.wibar.topright.system_widget.bluetooth')
local btr_widget = require('widgets.wibar.topright.system_widget.battery')
local int_widget = require('widgets.wibar.topright.system_widget.internet')
local snd_widget = require('widgets.wibar.topright.system_widget.sound')

local system_widget = { mt = { } }

local function new()
   return wibox.widget{
      {
         {
            bth_widget,
            int_widget,
            snd_widget,
            btr_widget,
            widget = wibox.layout.fixed.horizontal
         },
         bg = "#00ffff",
         widget = wibox.container.background,
      },
      margins = 0,
      widget = wibox.container.margin,
   }

end

function system_widget.mt:__call(...)
   return new(...)
end

return setmetatable(system_widget, system_widget.mt)
