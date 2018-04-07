class CreateIngredientCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredient_countries do |t|
      t.references :ingredient, null: false
      t.references :country, null: false
      t.timestamps
    end
    add_index :ingredient_countries, [:ingredient_id, :country_id], unique: true
  end
end
