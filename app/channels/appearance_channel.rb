# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class AppearanceChannel < ApplicationCable::Channel
  def subscribed
    current_user.try(:appear)
    stream_from "appearance"
  end

  def unsubscribed
    current_user.try(:disappear)
    # Any cleanup needed when channel is unsubscribed
  end

  def appear(data)
    if current_user
      current_user.appear(on: data['appearing_on'])
    end
  end
end
