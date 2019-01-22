class ChildrenController < ApplicationController
  before_action :current_child, only: [:home, :north, :east, :west, :south, :food, :doctor]
  before_action :alive?, only: [:home]
  def home
    doctor_exist?
    food_exist?

    if bird_attack?
      @child.hp -= rand(5..25)
      @child.save
      @bird = Bird.all.sample
      if @bird.sickness
        @child.sickness = true
        @child.save
      end
    end

    @child.hunger += rand(2..10)
    @child.save

    if alive?
      render :home
    else
      render :death
    end
  end

  def north
    @child.location_x += 1
    @child.save
    redirect_to "/"
  end

  def food
    @food = Food.all.sample
    @child.hunger -= @food.hunger_decrease
    @child.save
    redirect_to "/"
  end

  def doctor
    @doctor = Doctor.all.sample
    @child.hp += @doctor.hp
    @child.save
    redirect_to "/"
  end

  def east
    @child.location_y -= 1
    @child.save
    redirect_to "/"
  end

  def west
    @child.location_y += 1
    @child.save
    redirect_to "/"
  end

  def south
    @child.location_x -= 1
    @child.save
    redirect_to "/"
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

  def death
    render :death
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

  def alive?
    if current_child.hp > 0 && current_child.hunger < 100
      true
    else
      false
    end
  end


end
