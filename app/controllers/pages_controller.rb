class PagesController < ApplicationController
  def home
  end

  def dashboard
    if current_user
      @bookings = current_user.bookings
      @spaceships = current_user.spaceships
    else
      redirect root_path
    end
  end
end
