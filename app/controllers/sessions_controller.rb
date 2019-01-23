class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @child = Child.find_by(name: params[:name])
    if @child && @child.authenticate(params[:password])
      session[:user_id] = @child.id
      redirect_to @child
    else
      redirect_to login_path
      flash[:danger] = "You have entered incorrect credentials"
    end
  end
end
