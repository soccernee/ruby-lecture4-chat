# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from stream_name
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def test(data)
    ActionCable.server.broadcast("messages", message: "Text: #{data}")
  end

  def create(data)
    load_room
    message = @room.messages.create! content: data['message'], username: "socket"
    data['messageHtml'] = render_message(message)

    # NOT DO IT ON THE MAIN THREAD
    ActionCable.server.broadcast(stream_name, data)
  end

  private

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: message}
  end

  def stream_name
    "messages_room_#{params[:room]}"
  end

  def load_room
    @room = Room.find params[:room]
  end
end
