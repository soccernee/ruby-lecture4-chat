class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def say_hi
    ActionCable.server.broadcast("room", "Say Hello!")
  end

  def create_message(message_params)
    Rails.logger.info("create_message where message_params = #{message_params.inspect}")

    @message = Message.new(message_params.slice('body', 'username'))
    @message.room_id = 3
    data = {}

    if @message.save
      data[:rendered] = render_message(@message)
    else
      data[:rendered] = "Error: #{@message.errors.full_messages.to_sentence}"
    end

    ActionCable.server.broadcast("room", {message: data})
  end

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: message}
  end

end
