class MessagesController < ApplicationController
  def index
    load_room
    @messages = @room.messages

    respond_to do |format|
      format.json { render json: @messages }
      format.html
      format.js
    end
  end

  def create
    load_room
    @message = @room.messages.build message_params
    @message.username = current_user

    respond_to do |format|
      format.html do
        if @message.save
          redirect_to room_messages_path(@room)
        else
          flash[:error] = "Error: #{@message.errors.full_messages.to_sentence}"
          redirect_to root_path
        end
      end
      format.js 
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
