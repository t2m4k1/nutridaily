class ImagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
      @image = parent.images.build image_params
      @image.added_by = current_user
      if @image.save
          flash.now[:success] = "Micropost created!"
          redirect_to parent
      else
          flash[:error] = @image.errors.full_messages
      end
  end
  def destroy
  end

  private
   def parent
      if params[:user_id]
        User.find params[:user_id]
      elsif params[:recipe_id]
        Recipe.find params[:recipe_id]
      elsif params[:ingredient_id]
       Ingredient.find params[:ingredient_id] if params[:ingredient_id]
      end
   end

  def image_params
    params.require(:image).permit(:name, :path)
  end
end
