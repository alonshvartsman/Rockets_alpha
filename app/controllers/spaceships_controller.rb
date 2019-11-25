class SpaceshipsController < ApplicationController
  before_action :set_spaceship, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def new
    @spaceship = Spaceship.new
    authorize @spaceship
  end

  def index
    @spaceships = policy_scope(Spaceship).order(created_at: :desc)
  end

  def show
    @spaceship = Spaceship.find(params[:id])
  end

  def create
    @spaceship = Spaceship.new(spaceship_params)
    @spaceship.user = current_user
    authorize @spaceship
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

  def destroy
    @spaceship.destroy
    redirect_to spaceships_url, notice: 'Spaceship was successfully destroyed.'
  end

  private

  def set_spaceship
    @spaceship = Spaceship.find(params[:id])
    authorize @spaceship

  end

  def spaceship_params
    params.require(:spaceship).permit(:name, :cost, :launch_site, :photo)
  end
end
