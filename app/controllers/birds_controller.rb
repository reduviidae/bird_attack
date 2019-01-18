class BirdsController < ApplicationController

  def index
    @birds = Bird.all
  end

  def show
    @bird = Bird.find(params[:id])
  end

  def new
    @bird = Bird.new
  end

  def create
    @bird = Bird.create(bird_params)
    redirect_to @bird
  end

  def edit
    @bird = Bird.find(params[:id])
  end

  def update
    @bird = Bird.find(params[:id])
    @bird.update(bird_params)
    redirect_to @bird
  end

  def destroy
    @bird = Bird.find(params[:id])
    @bird.destroy
    redirect_to birds_path
  end

  private
  def bird_params
    params.require(:bird).permit(:species, :sickness, :attack)
  end

end
