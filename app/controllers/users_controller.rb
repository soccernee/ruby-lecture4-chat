class UsersController < ApplicationController
  def logout
    sign_out!
    redirect_back fallback_location: root_path, flash: {notice: "Logged out"}
  end
end
