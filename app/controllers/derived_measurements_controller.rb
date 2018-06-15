class DerivedMeasurementsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]

def create
    @derived_measurement = DerivedMeasurement.new derived_measurements_params
    @derived_measurement.added_by = current_user
    if @derived_measurement.save
        flash[:success] = 'Successfully added measurement'
        redirect_back_or @derived_measurement.nutritional_info.ingredient
    else
        flash[:error] = 'Couldn\'t add measurement'
        @ingredient = @derived_measurement.nutritional_info.ingredient
        render 'create'
    end
end
private
    def derived_measurements_params
        params.require(:derived_measurement).permit(:name, :amountInPercent, :nutritional_info_id)
    end
end
