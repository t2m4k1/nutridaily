class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.user_languages.build
  end

  def create
    defaults = {:verified_email=>"false", :remember_digest=>nil}
    complete = defaults.merge(user_params)
    @user = User.new(complete)
    @user.user_groups << UserGroup.new(group: Group.find_by(name: 'User'), role: 'Normal')
    @user.save
    log_in @user
    redirect_to @user
  end


  private
  def user_params
    #params.require(:user).permit(:name, :email, :password, :country_id, :password_confirmation, user_languages_attributes: [language_attributes: [:id]])
    params.require(:user).permit(:name, :email, :password, :country_id, :password_confirmation, user_language_ids: [], user_languages_attributes: [:language_id, :user_id])
  end
end
