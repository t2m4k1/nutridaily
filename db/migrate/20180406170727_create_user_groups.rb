class CreateUserGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :user_groups do |t|
      t.string :role, null: false
      t.references :user, null: false
      t.references :group, null: false
      t.timestamps
    end
    add_index :user_groups, [:user_id, :group_id], unique: true
  end
end
