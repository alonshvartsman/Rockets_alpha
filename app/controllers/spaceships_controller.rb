class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def new
    @spaceship = Spaceship.new
  end

  def index
    @spaceships = Spaceship.all
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    if @spaceship.save
      redirect_to @spaceship, notice: 'Spaceship was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @spaceship.update(spaceship_params)
    redirect_to spaceship_path(@spaceship)
  end

  def delete
    @spaceship.destroy
    redirect_to spaceships_url, notice: 'Spaceship was successfully destroyed.'
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :cost, :launch_site, :photo)
  end
end
