# app/assets/javascripts/cable/subscriptions/watcher.coffee
App.cable.subscriptions.create "WatcherChannel",
  received: (data)->
    $('[data-watchers]').text(data['count'])
