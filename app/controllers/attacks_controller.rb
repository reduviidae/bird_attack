class AttacksController < ApplicationController
  before_action :admin?

  def index
    @attacks = Attack.all
  end

  def show
    @attack = Attack.find(params[:id])
  end

  def new
    @attack = Attack.new
    @children = Child.all
    @birds = Bird.all
  end

  def create
    @attack = Attack.create(attack_params)
    redirect_to @attack
  end

  def edit
    @attack = Attack.find(params[:id])
    @children = Child.all
    @birds = Bird.all
  end

  def update
    @attack = Attack.find(params[:id])
    @attack.update(attack_params)
    redirect_to @attack
  end

  def destroy
    @attack = Attack.find(params[:id])
    @attack.destroy
    redirect_to birds_path
  end

  private
  def attack_params
    params.require(:attack).permit(:child_id, :bird_id)
  end


end
