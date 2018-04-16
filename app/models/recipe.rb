class Recipe < ApplicationRecord
  belongs_to :added_by, class_name: 'User'
  belongs_to :language

  has_many :recipe_steps, dependent: :destroy
  has_many :cook_book_recipes, dependent: :destroy
  has_many :cook_books, :through => :cook_book_recipes

  has_many :report_cases, as: :reported, dependent: :destroy
  has_many :images, as: :depicted, dependent: :destroy

  has_many :votes, as: :voted_on, dependent: :destroy
  has_many :users, through: :votes

  has_many :tags, as: :tagged, dependent: :destroy
end
