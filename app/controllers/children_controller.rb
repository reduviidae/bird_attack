class ChildrenController < ApplicationController
  before_action :current_child, only: [:home, :north, :east, :west, :south]
  def home
    doctor_exist?
    food_exist?
    bird_attack?
    render :home

  end

  def north
    @child.location_x += 1
    @child.save
    render :home
  end

  def east
    @child.location_y -= 1
    @child.save
    render :home
  end

  def west
    @child.location_y += 1
    @child.save
    render :home
  end

  def south
    @child.location_x -= 1
    @child.save
    render :home
  end

  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
    #MUST RANDOMLY GENERATE HP, HUNGER, X, AND Y
    @hp = rand(50..100)
    @hunger = rand(1..5)
    @location_x = rand(2)
    @location_y = rand(3)
  end

  def create
    byebug
    @child = Child.create(child_params)
    redirect_to @child
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    @child.update(child_params)
    redirect_to @child
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    redirect_to children_path
  end

  private
  def child_params
    params.require(:child).permit(:name, :password, :hp, :hunger, :location_x, :location_y)
  end

  def doctor_exist?
    @doctor_exist = [true, false, false, false].sample
  end

  def food_exist?
    @food_exist = [true, false, false].sample
  end

  def bird_attack?
    @bird_attack = [true, false].sample
  end

  def current_child
    @child = Child.all[0]
  end


end
