class Image < ApplicationRecord
  has_many :votes, as: :voted_on, dependent: :destroy
  belongs_to :depicted, polymorphic: true
  has_many :report_cases, as: :reported, dependent: :destroy
end
