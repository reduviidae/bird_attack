class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    # don't need anything in here, cause we're not setting up a
    # blank model to couple with the form
  end

  def create
    # no strong params cause there is no mass assignment
    @child = Child.find_by(name: params[:name])
    if @child && @child.authenticate(params[:password])
      session[:user_id] = @child.id
      byebug
      redirect_to @child
    else
      redirect_to login_path
    end
  end
end
