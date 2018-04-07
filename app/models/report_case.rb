class ReportCase < ApplicationRecord
    belongs_to :user
    belongs_to :reported, polymorphic: true
    belongs_to :report_category
end
