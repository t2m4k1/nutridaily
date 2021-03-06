class CreateNutritionalInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :nutritional_infos do |t|
      t.string :unit, null: false
      t.integer :kcal, null: false
      t.float :protein, null: false
      t.float :carbohydrates, null: false
      t.float :sugar, null: false
      t.float :fat, null: false
      t.float :saturates, null: false
      t.float :salt, null: false
      t.float :fibre
      t.float :alcohol
      t.references :ingredient, null: false
      t.references :added_by, references: :user, null:false
      t.timestamps
    end
    add_index :nutritional_infos, [:ingredient_id, :unit], unique: true
  end
end
