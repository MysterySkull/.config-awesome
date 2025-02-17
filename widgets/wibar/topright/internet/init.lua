local awful = require('awful')
local beautiful = require('beautiful')
local wibox = require('wibox')

local function get_internet_connectivity_info(str)
   local i = 0
   local t = {}

   while true do
      i = string.find(str, ' ', i+1)
      if i == nil then break end
      table.insert(t, i)
   end

   return {
      mode = string.sub(str, 1, t[1]-1),
      ssid = string.sub(str, t[1]+1, t[2]-1),
      force = string.sub(str, t[2]+1, string.len(str)),
   }
end

local function set_widget_image(widget, internet_info)
   -- Mode is the mode of connection =
   -- "no_connection" : There is no connection at all
   -- "ethernet" : Ethernet cable is connected
   -- "wifi" : Wifi is connected
   
   -- For wifi, force is used with the force is 0 to 4
   
   if (internet_info.mode == 'no_connection') then
      widget.image = beautiful.internet_icon_no_internet
   elseif (internet_info.mode == 'ethernet') then
      widget.image = beautiful.internet_icon_ethernet
   else 
      if (internet_info.force == "4") then
         widget.image = beautiful.internet_icon_wifi_4
      elseif (internet_info.force == "3") then
         widget.image = beautiful.internet_icon_wifi_3
      elseif (internet_info.force == "2") then
         widget.image = beautiful.internet_icon_wifi_2
      elseif (internet_info.force == "1") then
         widget.image = beautiful.internet_icon_wifi_1
      else
         widget.image = beautiful.internet_icon_wifi_0
      end
   end
   
end

-- Function return wireless or ethernet status
local itnet_widget = { mt = {} }

local function new()
   
   local internet_connectivity_info

   local w = wibox.widget{
      image = beautiful.internet_icon_wifi_4,
      widget = wibox.widget.imagebox
   }

   local w_tooltip = awful.tooltip{
      objects = { w },
   }

   local w_container = wibox.widget{
      w,
      widget = wibox.container.margin
   }

   awful.widget.watch('bash -c "~/.config/awesome/widgets/wibar/topright/internet/internet_status.sh"', 0.1, function(_, stdout)
      internet_connectivity_info = get_internet_connectivity_info(string.sub(stdout, 1, string.len(stdout) - 1))
      w_tooltip.text = internet_connectivity_info.ssid
      set_widget_image(w, internet_connectivity_info)
   end)

   return w_container
end

function itnet_widget.mt:__call(...)
   return new(...)
end

return setmetatable(itnet_widget, itnet_widget.mt)


