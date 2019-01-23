class ChildrenController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :admin?, only: [:index]
  #@current_user = nil

  def home
  end

  def game_mechanics
    @kb = false
    doctor_exist?
    food_exist?
    if bird_attack?
      @bird = Bird.all.sample
      @bird_damage = rand(5..@bird.attack)
      @current_user.hp -= @bird_damage
      @current_user.save
      if @bird_damage >= @current_user.hp
        @kb = true
      else
        @kb = false
      end
      @current_attack = Attack.create(bird_id: @bird.id, child_id: @current_user.id, damage_done: @bird_damage)
        if @bird.sickness
          @current_user.sickness = [true, false].sample
          @current_user.save
        end
    end
    if @current_user.sickness
      @sickness = rand(1..5)
      @current_user.hp -= @sickness
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
    @current_user.hp += @doctor.hp_increase
    @current_user.sickness = false
    if @current_user.hp > 100
      @current_user.hp = 100
    end
    @current_user.save
    redirect_to play_path
  end

  def start_over
    @current_user.hp = rand(50..100)
    @current_user.hunger = rand(1..5)
    @current_user.location_x = rand(2)
    @current_user.location_y = rand(3)
    @current_user.save
    @kb = false
    redirect_to @current_user
  end

  #Directionals ------------------------------------

  def north
    @current_user.location_x += 1
    @current_user.save
    game_mechanics
  end

  def east
    @current_user.location_y -= 1
    @current_user.save
    game_mechanics
  end

  def west
    @current_user.location_y += 1
    @current_user.save
    game_mechanics
  end

  def south
    @current_user.location_x -= 1
    @current_user.save
    game_mechanics
  end

  #------------------------------------------------------

  #Restful Routes ---------------------------------------

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

 #----------------------------------------------

  private
  def child_params
    params.require(:child).permit(:name, :password, :hp, :hunger, :location_x, :location_y)
  end

  def doctor_exist?
    @doctor_exist = [true, false, false, false, true, false].sample
  end

  def food_exist?
    @food_exist = [true, false, false, false].sample
  end

  def bird_attack?
    @bird_attack = [true, false, false, true, true].sample
  end

  def alive?
    if @current_user.hp <= 0 || @current_user.hunger >= 100
      false
    else
      true
    end
  end



end
