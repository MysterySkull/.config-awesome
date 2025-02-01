local naughty = require('naughty')

screen.connect_signal('tag::history::update', function()
   awesome.emit_signal('tag::selection')
end)

client.connect_signal('manage', function()
   awesome.emit_signal('client::added')
end)

client.connect_signal('unmanage', function()
   awesome.emit_signal('client::removed')
end)
