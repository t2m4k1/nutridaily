class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 25, null: false
      t.string :email, limit: 50, null: false
      t.string :password_digest
      t.integer :score
      t.references :photo, foreign_key: true
      t.references :cookbook
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamps
    end
  end
end
