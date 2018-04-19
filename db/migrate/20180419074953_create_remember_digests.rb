class CreateRememberDigests < ActiveRecord::Migration[5.1]
  def change
    create_table :remember_digests do |t|
      t.references :user, null: false
      t.string :digest, null: false
      t.datetime :last_login
      t.timestamps
    end
    add_index :remember_digests, [:user_id, :digest], unique: true
  end
end
