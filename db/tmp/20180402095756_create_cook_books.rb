class CreateCookBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :cook_books do |t|
      t.string :name, limit: 30
      t.references :icon
      t.references :recipe, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
  end
end
