class ChildrenController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  #before_action :current_child, only: [:home, :north, :east, :west, :south, :food, :doctor]
  $globalchild = nil

  def home
    doctor_exist?
    food_exist?
    if bird_attack?
      @bird = Bird.all.sample
      byebug
      $globalchild.hp -= rand(5..@bird.attack)
      $globalchild.save
      if @bird.sickness
        $globalchild.sickness = true
        $globalchild.save
      end
    end

    $globalchild.hunger += rand(2..10)
    $globalchild.save

    if alive?
      render :home
    else
      render :death
    end
  end

  def north
    $globalchild.location_x += 1
    $globalchild.save
    redirect_to play_path
  end

  def food
    @food = Food.all.sample
    $globalchild.hunger -= @food.hunger_decrease
    if $globalchild.hunger < 0
      $globalchild.hunger = 0
    end
    $globalchild.save
    redirect_to play_path
  end

  def doctor
    @doctor = Doctor.all.sample
    $globalchild.hp += @doctor.hp
    if $globalchild.hp > 100
      $globalchild.hp = 100
    end
    $globalchild.save
    redirect_to play_path
  end

  def east
    $globalchild.location_y -= 1
    $globalchild.save
    redirect_to play_path
  end

  def west
    $globalchild.location_y += 1
    $globalchild.save
    redirect_to play_path
  end

  def south
    $globalchild.location_x -= 1
    $globalchild.save
    redirect_to play_path
  end

  def login
    # $globalchild = Child.new
    # render :login
    # $globalchild = current_child
    # redirect_to play_path
  end

  def start_over
    $globalchild.hp = rand(50..100)
    $globalchild.hunger = rand(1..5)
    $globalchild.location_x = rand(2)
    $globalchild.location_y = rand(3)
    $globalchild.save
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
    @hp = rand(90..100)
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

  # def current_child
  #   #$globalchild = Child.all[0]
  #   @child = Child.find_by(name: params[:name])
  #   # byebug
  #   if @child
  #     $globalchild = @child
  #     redirect_to play_path
  #   else
  #     render :login
  #   end
  # end

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



  def alive?
    if $globalchild.hp > 0 && $globalchild.hunger < 100
      true
    else
      false
    end
  end


end
