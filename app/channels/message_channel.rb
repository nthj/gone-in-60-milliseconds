# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages:#{params[:source]}" # One of tweet, slack, sms
  end
end
