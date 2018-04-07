class CreateCookBookRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :cook_book_recipes do |t|
      t.references :cook_book, null: false
      t.references :recipe, null: false
      t.timestamps
    end
    add_index :cook_book_recipes, [:cook_book_id, :recipe_id], unique: true
  end
end
