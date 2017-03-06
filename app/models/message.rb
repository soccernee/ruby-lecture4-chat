class Message < ApplicationRecord
  belongs_to :room
  validates :body, :username, presence: true
end
