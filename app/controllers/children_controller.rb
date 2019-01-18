class ChildrenController < ApplicationController
  before_action :find_children

  def home
    render :home
  end

  private

  def find_children
    @children = Child.all
  end

end
