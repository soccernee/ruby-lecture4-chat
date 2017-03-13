class HomeController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.new
    @room.messages.build username: current_user.try(:username)
  end
end
