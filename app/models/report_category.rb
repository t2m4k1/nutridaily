class ReportCategory < ApplicationRecord
    has_many :report_category_languages, dependent: :destroy
    has_many :languages, :through => :report_category_languages
end
