class CreateRecipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_steps do |t|
      t.integer :number 
      t.text :description, limit: 250, null: false
      t.integer :duration, null: false
      t.float :measurement_multiplier
      t.references :recipe
      t.references :info_or_measurement
      t.string :info_or_measurement_type
      t.timestamps
    end
    add_index :recipe_steps, [:recipe_id, :number], unique: true
  end
end
