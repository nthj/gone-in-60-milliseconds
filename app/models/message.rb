class Message < ApplicationRecord
  scope :recent, -> { limit(100).reorder('created_at desc') }

  validates :content, :source, presence: true

  has_many :flags, dependent: :destroy

  after_commit { MessageRelayJob.perform_later(self) }
end
