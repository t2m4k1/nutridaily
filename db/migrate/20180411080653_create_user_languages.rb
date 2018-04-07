class CreateUserLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :user_languages do |t|
      t.references :user
      t.references :language
      t.timestamps
    end
    add_index :user_languages, [:user_id, :language_id], unique: true
  end
end
