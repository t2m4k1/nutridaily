class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.references :user, null: false
      t.references :voted_on, polymorphic: true
      t.string :voted_on_type
      t.integer :rating, null: false
      t.timestamps
    end
    add_index :votes, [:user_id, :voted_on_id, :voted_on_type], unique: true
  end
end
