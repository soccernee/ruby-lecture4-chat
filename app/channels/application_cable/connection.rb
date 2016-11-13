module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]].with_indifferent_access
    end

    def current_user
      return @current_user if @current_user
      if session[:username].present?
        @current_user = User.find_by(username: session[:username])
      end
    end
  end
end
