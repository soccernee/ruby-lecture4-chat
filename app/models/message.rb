class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :room

  def username_or_default
    username || "Guest"
  end
end
