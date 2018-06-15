class DerivedMeasurement < ApplicationRecord
  validates :amountInPercent, numericality: { only_integer: true, greater_than: 0, less_than: 2000 }
  belongs_to :added_by, class_name: 'User'
  belongs_to :nutritional_info
  has_many :recipe_steps, as: :info_or_measurement, dependent: :destroy
  has_many :report_cases, as: :reported, dependent: :destroy
end
