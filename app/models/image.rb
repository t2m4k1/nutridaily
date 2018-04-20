class Image < ApplicationRecord
  belongs_to :added_by, class_name: 'User'
  has_many :votes, as: :voted_on, dependent: :destroy
  belongs_to :depicted, polymorphic: true
  has_many :report_cases, as: :reported, dependent: :destroy
  mount_uploader :path, ImageFileUploader
end
