class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :authentication_id
      t.string :name, limit: 25, null: false
      t.string :email, limit: 50, null: false
      t.string :password_digest, null: false
      t.text :biography, limit: 250
      t.index :name, unique: true
      t.index :email, unique: true
      t.index :authentication_id, unique: true
      t.boolean :verified_email, default: false
      t.integer :score, default: 0
      t.integer :permission_level, default: 0
      t.references :country
      t.timestamps
    end
  end
end
