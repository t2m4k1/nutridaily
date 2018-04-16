class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.user_languages.build
  end

  def create
    @user = User.new(user_params)
    @user.save
    log_in @user
    redirect_to @user
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :country_id, :password_confirmation, user_language_ids: [], user_languages_attributes: [:language_id, :user_id])
  end
end
