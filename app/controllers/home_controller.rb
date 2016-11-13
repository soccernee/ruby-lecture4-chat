class HomeController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def logout
    session[:username] = nil
    redirect_back fallback_location: root_path
  end

  def login
    if username = params[:username].presence
      user = User.find_or_create_by(username: username)
      session[:username] = username
    end
    redirect_back fallback_location: root_path
  end
end
