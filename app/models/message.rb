class Message < ApplicationRecord
  belongs_to :room
  validates :body, :username, presence: true

  def user
    User.find_by(username: username)
  end
end
