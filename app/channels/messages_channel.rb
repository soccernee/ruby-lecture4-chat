class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{broadcast_topic}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def say_hi
    ActionCable.server.broadcast("#{broadcast_topic}", "Say Hello!")
  end

  def create_message(message_params)
    Rails.logger.info("create_message where message_params = #{message_params.inspect} & params = #{params.inspect}")

    @message = Message.new(message_params.slice('body', 'username'))
    @message.room_id = params['room_id']
    @message.username = current_user.username
    data = {}

    if @message.save
      data[:rendered] = render_message(@message)
      data[:body] = @message.body
    else
      data[:rendered] = "Error: #{@message.errors.full_messages.to_sentence}"
    end

    ActionCable.server.broadcast("#{broadcast_topic}", {message: data})
  end

  def delete_message(data) 
    @message = Message.find(data['id'])
    Rails.logger.info("delete_message = #{@message.inspect}")

    @message.destroy

    ActionCable.server.broadcast("#{broadcast_topic}", {deletedId: @message.id})

  end

  def broadcast_topic
    "room_#{params['room_id']}"
  end

  def render_message(message)
    ApplicationController.render partial: 'messages/message', locals: {message: message}
  end

end
