class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.added_by = current_user;
    @ingredient.save!
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

