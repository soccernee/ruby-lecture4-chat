class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  def self.online_users
    User.where.not(appeared_at: nil).pluck(:username).map{|e| "<span class='badge badge-primary mr-1'>#{e}</span>"}.join.html_safe
  end

  def to_s
    username
  end

  def appear(name = nil)
    self.appeared_at = Time.now
    if name
      self.appeared_on = name
    end
    save!
  end

  def disappear
    self.appeared_at = nil
    save!
  end
end
