class CreateReportCategoryLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :report_category_languages do |t|
      t.references :report_category, null: false
      t.references :language, null: false
      t.string :translation, null: false
      t.timestamps
    end
    add_index :report_category_languages, [:report_category_id, :language_id], unique: true, name: 'index_report_category_translation'
  end
end
