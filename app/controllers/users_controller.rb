class UsersController < ApplicationController
  def logout
    sign_out!
    redirect_to root_path, flash: {notice: "Logged out"}
  end
end
