class CookBook < ApplicationRecord
  belongs_to :added_by, class_name: 'User'
end
