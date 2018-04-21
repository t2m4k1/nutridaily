class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.added_by = current_user;
    if @ingredient.save
        redirect_back_or ingredients_path
        flash.now[:success] = 'Ingredient was added'
    else
        flash.now[:danger] = 'Ingredient wasn\'t added'
        redirect_back_or ingredients_path
    end
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def index
    @ingredients = Ingredient.all
  end
  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :language_id)
  end
end

