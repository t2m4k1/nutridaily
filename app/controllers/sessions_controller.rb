class SessionsController < ApplicationController

  def new
  end

  def create
    unless user = User.find_by(email: params[:session][:nameoremail].downcase)
        user = User.find_by(name: params[:session][:nameoremail].downcase)
    end
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid login credentials!'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
