class CreateCookBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cook_books do |t|
      t.string :name, limit: 30, null: false
      t.references :added_by, references: :user, null: false
      t.boolean :private, null: false
      t.timestamps
    end
    add_index :cook_books, [:name, :added_by_id], unique: true
  end
end
