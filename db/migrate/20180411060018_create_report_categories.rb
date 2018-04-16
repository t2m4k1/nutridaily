class CreateReportCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :report_categories do |t|
      t.string :name, index: true, unique: true
      t.string :reported_type
      t.integer :score_impact
      t.integer :minimum_score
      t.integer :minimum_permission_level, default: 0
      t.timestamps
    end
  end
end
