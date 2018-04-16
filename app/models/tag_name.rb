class TagName < ApplicationRecord
    before_save { self.name = name.downcase }
    has_many :tags
end
