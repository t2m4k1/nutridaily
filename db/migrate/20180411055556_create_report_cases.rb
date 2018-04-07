class CreateReportCases < ActiveRecord::Migration[5.1]
  def change
    create_table :report_cases do |t|
      t.references :user, null: false
      t.references :reported, polymorphic: true
      t.string :reported_type
      t.references :report_category, null: false
      t.text :description
      t.timestamps
    end
    add_index :report_cases, [:user_id, :reported_id, :reported_type, :report_category_id], unique: true, name: 'index_report_cases'
  end
end
