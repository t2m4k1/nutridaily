class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :voted_on, polymorphic: true
end
