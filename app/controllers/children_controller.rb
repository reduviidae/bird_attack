class ChildrenController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :admin?, only: [:index]
  @current_user = nil

  def home

    doctor_exist?
    food_exist?
    if bird_attack?
      @bird = Bird.all.sample
      @current_user.hp -= rand(5..@bird.attack)
      @current_user.save
      if @bird.sickness
        @current_user.sickness = [true, false].sample
        @current_user.save
      end
    end
    if @current_user.sickness
      @current_user.hp -= 2
      @current_user.save
    end

    @current_user.hunger += rand(2..10)
    @current_user.save

    if alive?
      render :home
    else
      render :death
    end
  end

  def unauthorized
  end

  def north
    @current_user.location_x += 1
    @current_user.save
    redirect_to play_path
  end

  def food
    @food = Food.all.sample
    @current_user.hunger -= @food.hunger_decrease
    if @current_user.hunger < 0
      @current_user.hunger = 0
    end
    @current_user.save
    redirect_to play_path
  end

  def doctor
    @doctor = Doctor.all.sample
    @current_user.hp += @doctor.hp
    @current_user.sickness = false
    if @current_user.hp > 100
      @current_user.hp = 100
    end
    @current_user.save
    redirect_to play_path
  end

  def east
    @current_user.location_y -= 1
    @current_user.save
    redirect_to play_path
  end

  def west
    @current_user.location_y += 1
    @current_user.save
    redirect_to play_path
  end

  def south
    @current_user.location_x -= 1
    @current_user.save
    redirect_to play_path
  end

  # def login
    # @current_user = Child.new
    # render :login
    # @current_user = current_child
    # redirect_to play_path
  # end

  def start_over
    @current_user.hp = rand(50..100)
    @current_user.hunger = rand(1..5)
    @current_user.location_x = rand(2)
    @current_user.location_y = rand(3)
    @current_user.save
    redirect_to @current_user
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
  #   #@current_user = Child.all[0]
  #   @child = Child.find_by(name: params[:name])
  #   # byebug
  #   if @child
  #     @current_user = @child
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
    if @current_user.hp > 0 && @current_user.hunger < 100
      true
    else
      false
    end
  end


end
