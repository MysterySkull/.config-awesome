local awful = require('awful')
local beautiful = require('beautiful')
local gears = require('gears')
local rubato = require('rubato')
local wibox = require('wibox')

local client_color = '#ffffff'
local no_client_color = '#777777'

local previous_selected_tag = 1

local tag_circle = beautiful.tag_circle
local tagbar_height = tag_circle.height
local wibar_height = beautiful.wibar_height
local tagbar_circle_selected_width = tag_circle.selected_width
local tagbar_circle_unselected_width = tag_circle.unselected_width
local tagbar_margin = tagbar_height / 2
local tagbar_top_bottom_margin = (wibar_height - tagbar_height) / 2

local animation_duration = tag_circle.selection_animation_duration

local tag_bar = { mt = {} }

local tag_item = function(widget_width, color, index, animation_type)

   local animate = function(position)
      return rubato.timed{
         duration = animation_duration,
         pos = position,
         easing = rubato.quadradic
      }
   end

   local t_buttons = gears.table.join(
      awful.button({ }, 1, function() awful.screen.focused().tags[index]:view_only()  end)
   )

   local t_item = wibox.widget{
      {
         text = '',
         widget = wibox.widget.textbox
      },
      visible = true,
      forced_width = widget_width,
      bg = color,
      shape = gears.shape.rounded_bar,
      widget = wibox.container.background
   }

   local animation

   if animation_type ~= nil then
      if animation_type == "selection" then
         animation = animate(tagbar_circle_unselected_width)
      elseif animation_type == "unselection" then
         animation = animate(tagbar_circle_selected_width)
      end
      animation:subscribe(function(w)
         t_item.forced_width = w
      end)
      animation.target = widget_width
   end

   return wibox.widget{
      {
         widget = t_item
      },
      top = tagbar_top_bottom_margin,
      bottom = tagbar_top_bottom_margin,
      left = tagbar_margin/2,
      right = tagbar_margin/2,
      buttons = t_buttons,
      widget = wibox.container.margin
   }
end

local update_tagbar_client_number = function(self)
   self:reset()
   for i, k in pairs(awful.screen.focused().tags) do
      --naughty.notify({text = i .. ' & ' .. k.name})
      local color
      if #k:clients() > 0 then color = client_color else color = no_client_color end
      if k.selected == true then
         self:add(tag_item(tagbar_circle_selected_width, color))
      else
         self:add(tag_item(tagbar_circle_unselected_width, color))
      end
   end
end

local update_tagbar_animation = function(self)
   local selected_tag

   self:reset()
   for i, k in pairs(awful.screen.focused().tags) do
      --naughty.notify({text = i .. ' & ' .. k.name})
      local color
      if #k:clients() > 0 then color = client_color else color = no_client_color end
      if k.selected == true  then

         if k.index ~= previous_selected_tag then
            self:add(tag_item(tagbar_circle_selected_width, color, k.index, "selection"))
            selected_tag = k.index
         else
            self:add(tag_item(tagbar_circle_selected_width, color, k.index))
            selected_tag = k.index
         end
      elseif k.index == previous_selected_tag then
         self:add(tag_item(tagbar_circle_unselected_width, color, k.index, "unselection"))
      else
         self:add(tag_item(tagbar_circle_unselected_width, color, k.index))
      end
   end

   previous_selected_tag = selected_tag
end

tag_bar.get_width = function()
   local width = #awful.screen.focused().tags
      * (tagbar_circle_unselected_width + tagbar_margin)
      + tagbar_circle_selected_width - tagbar_circle_unselected_width
   return width
end

local function new(args)

   local t_bar = wibox.widget{
      layout = wibox.layout.fixed.horizontal
   }

   update_tagbar_client_number(t_bar)

   awesome.connect_signal('tag::selection', function()
      update_tagbar_animation(t_bar)
   end)

   awesome.connect_signal('client::added', function()
      update_tagbar_client_number(t_bar)
   end)

   awesome.connect_signal('client::removed', function()
      update_tagbar_client_number(t_bar)
   end)

   return t_bar
end

function tag_bar.mt:__call(...)
   return new(...)
end

return setmetatable(tag_bar, tag_bar.mt)
