local awful = require('awful')
local beautiful = require('beautiful')
local naughty = require('naughty')
local wibox = require('wibox')

local bty_widget = { mt = {} }

local animation_counter = 0

local function set_icon_percent_charging(widget, percent)
   local percent = tonumber(percent)
   local icon = {
      beautiful.battery_icon_00_charging,
      beautiful.battery_icon_10_charging,
      beautiful.battery_icon_20_charging,
      beautiful.battery_icon_30_charging,
      beautiful.battery_icon_40_charging,
      beautiful.battery_icon_50_charging,
      beautiful.battery_icon_60_charging,
      beautiful.battery_icon_70_charging,
      beautiful.battery_icon_80_charging,
      beautiful.battery_icon_90_charging,
      beautiful.battery_icon_100_charging,
   }

   local index = math.floor((percent+5)/10)

   animation_counter = animation_counter + 0.1
   if animation_counter+index >= 12 then
      animation_counter = 0
   end

   widget.image = icon[index+ math.floor(animation_counter)]
end

local function set_icon_percent_not_charging(widget, percent)
   local percent = tonumber(percent)
   local icon = {
      beautiful.battery_icon_00,
      beautiful.battery_icon_10,
      beautiful.battery_icon_20,
      beautiful.battery_icon_30,
      beautiful.battery_icon_40,
      beautiful.battery_icon_50,
      beautiful.battery_icon_60,
      beautiful.battery_icon_70,
      beautiful.battery_icon_80,
      beautiful.battery_icon_90,
      beautiful.battery_icon_100,
   }
   
   local index = math.floor( (percent+5) / 10 ) + 1

   widget.image = icon[index]
end

local function set_battery_icon(widget, str_battery)
   local battery_percent = string.sub(
      str_battery,
      1,
      string.find(str_battery, '\n')-1
   )

   local battery_status = string.sub(
      str_battery,
      string.len(battery_percent) + 2,
      string.len(str_battery)
   )

   if (battery_status == "Charging") then
      set_icon_percent_charging(widget, battery_percent)
   else
      set_icon_percent_not_charging(widget, battery_percent)
   end
end

local set_battery_percent = function(tooltip, str_battery)
   local battery_percent = string.sub(
      str_battery,
      1,
      string.find(str_battery,'\n') - 1
   )

   tooltip.text = battery_percent .. " %"
end

local function new()

   local w = wibox.widget{
      resize = true,
      widget = wibox.widget.imagebox
   }

   local w_tooltip = awful.tooltip{
      objects = { w },
   }

   awful.widget.watch('cat /sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/capacity /sys/bus/acpi/drivers/battery/PNP0C0A:00/power_supply/BAT0/status', 0.1, function(_, stdout)
      local str = string.sub(stdout,1, string.len(stdout)-1)
      set_battery_icon(w, str)
      set_battery_percent(w_tooltip, str)
   end)

   local container = wibox.widget{
      {
         w,
         bg = "#00ff00",
         widget = wibox.container.background
      },
      margins = (beautiful.wibar_height - beautiful.battery_icon_size)/2,
      widget = wibox.container.margin
   }

   return container
end

function bty_widget.mt:__call(...)
   return new(...)
end

return setmetatable(bty_widget, bty_widget.mt)
