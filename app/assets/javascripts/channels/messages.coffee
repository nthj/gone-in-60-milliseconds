App.messageReceiver =
  collection: -> $("[data-channel='messages']")

  received: (data) ->
    @collection().append(data.message)


# App.cable.subscriptions.create { channel: "MessageChannel", source: 'slack' }, App.messageReceiver

# App.cable.subscriptions.create { channel: "MessageChannel", source: 'sms' }, App.messageReceiver

# App.cable.subscriptions.create { channel: "MessageChannel", source: 'tweet' }, App.messageReceiver
