class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, limit: 50, null: false
      t.integer :serving_count, null: false
      t.references :price_category, null: false
      t.boolean :is_drink, default: false
      t.boolean :is_private, default: false
      t.references :language, null: false
      t.references :added_by, references: :user, null: false
      t.timestamps
    end
    add_index :recipes, [:name, :added_by_id, :is_private, :language_id], unique: true, name: 'index_recipe_name_addedby_priv_lang'
  end
end
