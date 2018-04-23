class NutritionalInfosController < ApplicationController
def create
    raise
    @nutritional_info = NutritionalInfo.new nutritional_info_params
    if @nutritional_info.save
        redirect_back_or @ingredient 
    else
        flash[:error] = @nutritional_info.errors.full_messages
        render 'create'
    end
end
private
    def nutritional_info_params
        params.require(:nutritional_info).permit(:kcal, :amount, :unit, :protein, :carbohydrates, :sugar, :fat, :saturates, :salt, :fibre, :alcohol, :price)
    end
end
