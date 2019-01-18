class ChildrenController < ApplicationController
  # before_action :find_children
  #
  # def home
  #   render :home
  # end
  #
  # private
  #
  # def find_children
  #   @children = Child.all
  # end

  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
    #MUST RANDOMLY GENERATE HP, HUNGER, X, AND Y
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

  private
  def child_params
    params.require(:child).permit(:name, :password, :hp, :hunger, :sickness, :location_x, :location_y)
  end

end
