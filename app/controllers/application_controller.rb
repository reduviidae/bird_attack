class ApplicationController < ActionController::Base
  before_action :authorized
  helper_method :logged_in?


  def authorized
    unless logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def admin?
    unless @current_user.admin
      redirect_to "/unauthorized"
    end
  end

  def current_user
    if session[:user_id]
      @current_user = Child.find(session[:user_id])
    end
  end

  def unauthorized
  end
  
end
