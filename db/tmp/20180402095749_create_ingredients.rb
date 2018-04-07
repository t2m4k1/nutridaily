class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, limit: 40, null: false
      t.timestamp :created_at
      t.references :photo, foreign_key: true
      t.references :ingredient_info, foreign_key: true, null: false
      t.references :available_in_country, null: false
      t.references :added_by, null: false
      t.timestamps
    end
  end
end
