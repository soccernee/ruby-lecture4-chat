class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    stream_from "appearance"
    current_user.appear
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    disappear
  end

  def appear(data = nil)
    current_user.appear
    ActionCable.server.broadcast("appearance", User.online_users)
  end

  def disappear
    current_user.disappear
    ActionCable.server.broadcast("appearance", User.online_users)
  end
end
