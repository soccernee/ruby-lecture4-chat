class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    return @current_user if @current_user
    if username = cookies.signed[:username]
      @current_user = User.find_or_create_by(username: username)
      @current_user.ip = request.remote_ip
      @current_user.save!
    end
  end

  def sign_in!(username)
    cookies.signed[:username] = username
  end

  def sign_out!
    cookies.signed[:username] = nil
  end
end
