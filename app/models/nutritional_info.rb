class NutritionalInfo < ApplicationRecord
  belongs_to :ingredient
  belongs_to :added_by, class_name: 'User'
  has_many :derived_measurements
  has_many :recipe_steps, as: :info_or_measurement, dependent: :destroy
  has_many :report_cases, as: :reported, dependent: :destroy
end
