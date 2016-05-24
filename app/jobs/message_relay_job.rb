class MessageRelayJob < ApplicationJob
  def perform(message)
    ActionCable.server.broadcast "messages:#{message.source}",
      message: MessagesController.render(partial: 'messages/message', locals: { message: message })
  end
end
