class IngredientsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    @existingIngredient = Ingredient.find_by(name: @ingredient.name)
    if @existingIngredient && @existingIngredient.countries.include?(current_user.country)
        flash.now[:info] = 'Ingredient already exists'
        redirect_back_or ingredients_path
    else
        @ingredient.added_by = current_user
        @ingredient.countries << current_user.country
        @ingredient.nutritional_infos.each do |nutritional_info|
            nutritional_info.added_by = current_user
        end
        if @ingredient.save
            flash.now[:success] = 'Ingredient was added'
            redirect_back_or ingredients_path
        else
            flash[:danger] = @ingredient.errors.full_messages #'Ingredient wasn\'t added'
            redirect_back_or ingredients_path
        end
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
    params.require(:ingredient).permit(:name, nutritional_infos_attributes: [:amount, :unit, :kcal, :protein, :carbohydrates, :fat, :saturates, :alcohol, :sugar, :salt, :fibre, :price])
  end
end

