class CreateDerivedMeasurements < ActiveRecord::Migration[5.1]
  def change
    create_table :derived_measurements do |t|
      t.string :name, null: false
      t.integer :amountInPercent, null: false
      t.references :nutritional_info, null: false
      t.references :added_by, references: :user, null:false
      t.timestamps
    end
    add_index :derived_measurements, [:name, :nutritional_info_id], unique: true
  end
end
