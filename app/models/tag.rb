class Tag < ApplicationRecord
  belongs_to :user
  belongs_to :tagged, polymorphic: true
  has_many :votes, as: :voted_on, dependent: :destroy
  has_many :users, through: :votes
end
