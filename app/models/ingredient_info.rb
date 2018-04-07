class IngredientInfo < ApplicationRecord
  belongs_to :ingredient
  belongs_to :added_by, class_name: 'User'
  has_many :recipe_steps, dependent: :destroy
  has_many :report_cases, as: :reported, dependent: :destroy
end
