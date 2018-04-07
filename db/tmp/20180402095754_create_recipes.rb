class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, limit: 50, null: false
      t.references :recipe_step, foreign_key: true, null: false
      t.references :photo, foreign_key: true
      t.references :added_by, null: false
      t.timestamps
    end
  end
end
