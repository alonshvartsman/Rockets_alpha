class BookingsController < ApplicationController
  def new
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking.spaceship = @spaceship
    @booking.user = current_user
    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def update
    @spaceship = spaceship.find[params :spaceship_id]
    @booking.update(booking_params)
    redirect_to spaceship_path(@spaceship)
  end

  def edit
    @spaceship = Spaceship.find(params[:spaceship_id])
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date)
  end
end
