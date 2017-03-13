class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def to_s
    username
  end
end
