class PagesController < ApplicationController
  def dashboard
    if current_user
      @bookings = current_user.bookings
      @spaceships = current_user.spaceships
      authorize @spaceships
      authorize @bookings
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect root_path
    end
  end
end
