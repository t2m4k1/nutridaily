class IngredientCountry < ApplicationRecord
  belongs_to :ingredient
  belongs_to :country
end
