class RecipeStep < ApplicationRecord
  belongs_to :info_or_measurement, polymorphic: true
end
