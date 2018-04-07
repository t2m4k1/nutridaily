class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name, limit: 40, null: false
      t.references :language, null: false
      t.references :added_by, references: :user
      t.timestamps
    end
    add_index :ingredients, [:name, :language_id], unique: true
  end
end
