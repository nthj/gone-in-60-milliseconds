# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class FlagsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'flags'
  end

  def receive(data)
    Flag.create(data)
  end
end
