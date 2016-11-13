class User < ApplicationRecord
  def self.online
    where.not(last_online_at: nil)
  end

  def to_s
    username
  end

  def appear(options = {})
    self.last_online_at = Time.now
    self.appearing_on = options[:on]
    self.save
    ActionCable.server.broadcast("appearance", method: 'appearance', html: render_online_users)
  end

  def disappear
    self.last_online_at = nil
    self.appearing_on = nil
    self.save
    ActionCable.server.broadcast("appearance", method: 'appearance', html: render_online_users)
  end

  def render_online_users
    ApplicationController.render partial: 'layouts/online_users'
  end
end
