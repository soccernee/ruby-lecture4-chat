class MessagesController < ApplicationController
  def index
    load_room
    @messages = @room.messages
  end

  def create
    load_room
    @message = @room.messages.build message_params
    @message.username = current_user

    if @message.save
      redirect_to room_messages_path(@room)
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_to root_path
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def load_room
    @room = Room.find params[:room_id]
  end
end
