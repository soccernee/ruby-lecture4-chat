class RoomsController < ApplicationController
  def create
    @room = Room.create params.require(:room).permit(:name)
    if @room.persisted?
      redirect_to @room
    else
      flash[:error] = "Error: #{@room.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
    end
  end

  def show
    @room = Room.find params[:id]
    redirect_to room_messages_path(@room)
  end
end
