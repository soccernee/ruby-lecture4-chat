class RoomsController < ApplicationController
  def show
    @room = Room.find params[:id]
  end

  def create
    @room = Room.new room_params
    if @room.save
      redirect_to @room
    else
      flash[:error] = "Error: #{@room.errors.full_messages.to_sentence}"
      redirect_back fallback_location: root_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
