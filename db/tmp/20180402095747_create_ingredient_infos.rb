class CreateIngredientInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_infos do |t|
      t.string :measurement_name, limit: 20, null: false
      t.integer :kcal, null: false
      t.float :protein, null: false
      t.float :carbohydrates, null: false
      t.float :sugar, null: false
      t.float :fat, null: false
      t.float :saturates, null: false
      t.float :salt, null: false
      t.float :fibre
      t.float :alcohol
      t.references :verified_by
      t.references :rejected_by
      t.references :added_by, null: false
      t.timestamps
    end
  end
end
