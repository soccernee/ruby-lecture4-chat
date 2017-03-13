class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return @current_user if @current_user
    if session[:username]
      @current_user = User.find_or_create_by(username: session[:username])
    end
  end

  def sign_in!(username)
    session[:username] = username
  end

  def sign_out!
    session[:username] = nil
  end
end
