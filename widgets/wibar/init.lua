local main_wibar = require('widgets.wibar.topleft')
local system_wibar = require('widgets.wibar.topright')

local _M = {}


_M.create_wibars = function(s)
   main_wibar{ screen = s }
   system_wibar{ screen = s}
end

return _M
