class Flag < ApplicationRecord
  belongs_to :message

  # NOTE: When we hit Web Scale™ let's extract this into a PostgreSQL Trigger
  # NOTE: This should stay as an after_commit; pg_notify is sent whether the transaction succeeds or not
  #       (Same for Redis, or any other Pub/Sub.)
  after_commit :broadcast, on: :create

protected

  def broadcast
    ActionCable.server.broadcast 'flags', message_id: message_id, count: message.flags.count
  end
end
