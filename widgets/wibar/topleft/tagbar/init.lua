local awful = require('awful')
local beautiful = require('beautiful')
local gobject = require('gears.object')
local gears = require('gears')
local naughty = require('naughty')
local wibox = require('wibox')

screen.connect_signal('tag::history::update', function(screen)
   awesome.emit_signal('tag::selection', screen)
end)

client.connect_signal('manage', function()
   naughty.notify({text = 'new client'})
end)

client.connect_signal('unmanage', function()
   naughty.notify({text = 'one less client'})
end)

local tag_button = function(id)
   return wibox.widget{
      {
         {
            text = ' ',
            widget = wibox.widget.textbox,
         },
         id = id,
         fg = "#000000",
         bg = "#ffffff",
         forced_width = 15,
         shape = gears.shape.rounded_bar,
         visible = true,
         widget = wibox.container.background

      },
      bottom = 7.5,
      top = 7.5,
      left = 7.5/2,
      right = 7.5/2,
      widget = wibox.container.margin
   }
end

local tagbar = wibox.widget{
   tag_button("1"),
   tag_button("2"),
   widget = wibox.layout.fixed.horizontal
}

awesome.connect_signal('tag::selection', function(screen)
   naughty.notify({text = 'tag selection'})
   local tag = awful.screen.focused{}.selected_tag.name
   local tbar = tagbar.get_children()
   naughty.notify({text = tbar.widget.text})
   tbar.get_children_by_id("1")[1].forced_width = 25
end)

return tagbar
