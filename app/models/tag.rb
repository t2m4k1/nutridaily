class Tag < ApplicationRecord
  belongs_to :tag_name
  belongs_to :tagged, polymorphic: true
end
