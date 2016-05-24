# Thread.new do
#   loop do
#     sleep 1
#     ActionCable.server.broadcast 'watchers', count: ActionCable.server.connections.count
#   end
# end
