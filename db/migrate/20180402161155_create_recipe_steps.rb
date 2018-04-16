class CreateRecipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_steps do |t|
      t.integer :number 
      t.text :description, limit: 250, null: false
      t.integer :duration, null: false
      t.references :nutritional_info
      t.float :measurement_multiplier
      t.references :recipe
      t.timestamps
    end
  end
end
