class Subscription < ApplicationRecord
    belongs_to :user
    belongs_to :subscribed_to, polymorphic: true 
end
