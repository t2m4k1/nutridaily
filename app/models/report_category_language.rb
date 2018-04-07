class ReportCategoryLanguage < ApplicationRecord
    belongs_to :report_category
    belongs_to :language
end
