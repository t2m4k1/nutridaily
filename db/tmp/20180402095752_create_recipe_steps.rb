class CreateRecipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_steps do |t|
      t.text :description, limit: 250, null: false
      t.integer :duration, null: false
      t.references :ingredient, foreign_key: true
      t.timestamps
    end
  end
end
