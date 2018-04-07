class Country < ApplicationRecord
  has_many :ingredient_countries, dependent: :destroy
  has_many :ingredients, :through => :ingredient_countries
  has_many :users
  #self.primary_key = "name"
end
