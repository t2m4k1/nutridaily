class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, limit: 25, null: false
      t.string :email, limit: 50, null: false
      t.string :password_digest, null: false
      t.string :remember_digest
      t.text :biography, limit: 250
      t.index :name, unique: true
      t.index :email, unique: true
      t.boolean :verified_email, default: false
      t.integer :score, default: 0
      t.integer :permission_level, default: 0
      t.references :country
      t.timestamps
    end
  end
end
