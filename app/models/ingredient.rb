class Ingredient < ApplicationRecord
  validates :nutritional_infos, presence: true
  belongs_to :added_by, class_name: 'User'
  has_many :nutritional_infos, dependent: :destroy
  has_many :recipe_steps, dependent: :destroy

  has_many :ingredient_countries, dependent: :destroy
  has_many :countries, :through => :ingredient_countries
  
  belongs_to :language

  has_many :report_cases, as: :reported, dependent: :destroy
  has_many :images, as: :depicted, dependent: :destroy
  accepts_nested_attributes_for :nutritional_infos
end
