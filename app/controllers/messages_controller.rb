class MessagesController < ApplicationController

  # POST /room/:id/messages
  def create
    set_room
    @message = @room.messages.build message_params
    if @message.save
      redirect_to @room
    else
      flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
      redirect_back fallback_location: room_path(@room)
    end
  end

  private
  def set_room
    @room = Room.find params[:room_id]
  end

  def message_params
    params.require(:message).permit(:body, :username)
  end
end
