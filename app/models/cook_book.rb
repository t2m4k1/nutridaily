class CookBook < ApplicationRecord
  belongs_to :added_by, class_name: 'User'
  has_many :cook_book_recipes, dependent: :destroy
  has_many :recipes, :through => :cook_book_recipes
end
