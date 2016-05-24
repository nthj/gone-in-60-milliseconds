# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class WatcherChannel < ApplicationCable::Channel
  periodically every: 1.second do
    ActionCable.server.broadcast 'watchers', count: ActionCable.server.connections.count
  end

  def subscribed
    stream_from 'watchers'
  end
end
