local awful = require('awful')
local gears = require('gears')
local beautiful = require('beautiful')
local snd_w_btn = require('widgets.wibar.topright.sound.button')
local wibox = require('wibox')

local clk_widget = { mt = {} }

local set_sound_icon = function(widget, str_volume)
   local isMute = string.sub(str_volume, 1, 1)

   if (isMute == "1") then
      widget.image = gears.color.recolor_image(beautiful.sound_icon_mute, beautiful.sound_icon_color)
   else

      -------------------------------------------------------------------
      --- TODO : Documenter un peu ce qu'il se passe pour quand je    ---
      --- y revenir dessus                                            ---
      -------------------------------------------------------------------

      local space_index = string.find(str_volume, " ", 3)
      local volume = tonumber(string.sub(str_volume, 3, space_index - 1))

      if volume > 80 then
         widget.image = gears.color.recolor_image(beautiful.sound_icon_max, beautiful.sound_icon_color)
      elseif volume > 60 then
         widget.image = gears.color.recolor_image(beautiful.sound_icon_75, beautiful.sound_icon_color)
      elseif volume > 40 then
         widget.image = gears.color.recolor_image(beautiful.sound_icon_50, beautiful.sound_icon_color)
      elseif volume > 20 then
         widget.image = gears.color.recolor_image(beautiful.sound_icon_25, beautiful.sound_icon_color)
      else
         widget.image = gears.color.recolor_image(beautiful.sound_icon_min, beautiful.sound_icon_color)
      end
   end
end

local get_volume = function(tooltip, str_volume)
   local isMute = string.sub(str_volume, 1, 1)

   if (isMute == "1") then
      tooltip.text = "Mute"
   else

      -------------------------------------------------------------------
      --- TODO : Documenter un peu ce qu'il se passe pour quand je    ---
      --- y revenir dessus                                            ---
      -------------------------------------------------------------------

      local space_index = string.find(str_volume, " ", 3)
      tooltip.text = string.sub(str_volume, 3, space_index - 1) .. " %"
   end
end

local function new()

   local w = wibox.widget{
      resize = true,
      buttons = snd_w_btn,
      widget = wibox.widget.imagebox
   }

   local w_tooltip = awful.tooltip{
      objects = { w },
   }

   local container = wibox.widget{
      {
         {
            widget = w,
         },
         --bg = "#0000ff",
         widget = wibox.container.background,
      },
      margins = (beautiful.wibar.height - beautiful.sound_icon_size)/2,
      widget = wibox.container.margin
   }

   awful.widget.watch('bash -c "pulsemixer --get-mute --get-volume"', 0.1, function(widget, stdout)
      get_volume(w_tooltip, stdout)
      set_sound_icon(w, stdout)
   end)

   --return container
   return container
end

function clk_widget.mt:__call(...)
   return new(...)
end

return setmetatable(clk_widget, clk_widget.mt)
