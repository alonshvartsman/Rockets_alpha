class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
  def new
    @spaceship = Spaceship.new
  end

  def index
    @spaceships = Spaceship.all
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    if @spaceship.save
      redirect_to @spaceship, notice: 'Spaceship was successfully created.'
    else
      render :new
    end
  end

  def show
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
    params.require(:spaceship).permit(:name, :cost, :launch_site)
  end
end
