class Language < ApplicationRecord
  has_many :user_languages, dependent: :destroy
  has_many :users, :through => :user_languages
  has_many :recipes, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :report_category_languages, dependent: :destroy
end
