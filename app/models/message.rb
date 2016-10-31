class Message < ApplicationRecord
  validates :content, presence: true

  def username_or_default
    username || "Guest"
  end
end
