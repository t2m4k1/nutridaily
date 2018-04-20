class ImagesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
      @image = current_user.uploaded_images.build(image_params)
      @image.added_by = current_user
      @image.depicted = current_user
      if @image.save
          flash[:success] = "Micropost created!"
      else
          flash[:success] = @image.errors.full_messages
      end
  end
  def destroy
  end

  private
  def image_params
    params.require(:image).permit(:name, :path)
  end
end
