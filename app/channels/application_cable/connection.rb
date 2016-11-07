module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
    end

    def session
      cookies.encrypted[Rails.application.config.session_options[:key]]
    end

    def current_user
      session["username"]
    end
  end
end
