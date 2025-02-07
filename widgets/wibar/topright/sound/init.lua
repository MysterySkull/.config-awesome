local awful = require('awful')
local snd_w_btn = require('widgets.wibar.topright.sound.button')
local wibox = require('wibox')

local sound_icon = "\u{f057e} "

local clk_widget = { mt = {} }

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
      text = sound_icon,
      buttons = snd_w_btn,
      widget = wibox.widget.textbox
   }

   local w_tooltip = awful.tooltip{
      objects = { w },
   }

   awful.widget.watch('bash -c "pulsemixer --get-mute --get-volume"', 0.01, function(widget, stdout)
      get_volume(w_tooltip, stdout)
   end)

   return w
end

function clk_widget.mt:__call(...)
   return new(...)
end

return setmetatable(clk_widget, clk_widget.mt)
