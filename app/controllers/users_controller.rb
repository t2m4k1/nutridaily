class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.user_languages.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
        redirect_to @user
    else
        flash.now[:danger] = 'User can\'t be registered!'
        render 'new'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :country_id, :password_confirmation, user_language_ids: [], user_languages_attributes: [:language_id, :user_id])
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
end
