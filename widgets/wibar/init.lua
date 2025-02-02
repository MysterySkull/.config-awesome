local main_wibar = require('widgets.wibar.topleft')
local system_wibar = require('widgets.wibar.topright')

local _M = {}


_M.create_wibars = function(s)
   local m_wb = main_wibar{
      screen = s
   }
   system_wibar.create_system_wibar(s)
end

return _M
