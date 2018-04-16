class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string :name, limit: 50, null: false
      t.integer :serving_count, null: false
      t.boolean :is_drink, default: false
      t.references :language, null: false
      t.references :added_by, references: :user, null: false
      t.timestamps
    end
    add_index :recipes, [:name, :language_id], unique: true
  end
end
