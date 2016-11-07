# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    Rails.logger.info "MessagesChannel#subscribed"
    stream_from stream_name
  end

  def unsubscribed
    Rails.logger.info "MessagesChannel#unsubscribed"
    # Any cleanup needed when channel is unsubscribed
  end

  def create(data)
    a = Message.new content: data["content"], room_id: data["room"]
    a.username = current_user
    if a.save
      ActionCable.server.broadcast(stream_name, method: 'append', html: render_message(a))
    end
  end

  private

  # TODO: we will make this room-specific later
  def stream_name
    "messages"
  end

  def render_message(message)
    ApplicationController.render message
  end
end
