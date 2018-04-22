class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user,   only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @image = Image.new
  end

  def new
    @user = User.new
    @user.user_languages.build
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
        log_in @user
        redirect_back_or @user
    else
        flash.now[:danger] = 'Couldn\'t register user!'
        render 'new'
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
        user.forget_all_tokens
        flash[:success] = "Profile updated"
        redirect_to user
    else
      flash.now[:danger] = user.errors.full_messages
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :country_id, :password_confirmation,:profile_pictures_attributes => [:name, :path],  user_language_ids: [], user_languages_attributes: [:language_id, :user_id])
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end
end
