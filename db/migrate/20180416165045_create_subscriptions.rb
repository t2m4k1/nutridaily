class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false
      t.references :subscribed_to, polymorphic: true
      t.string :subscribed_to_type
      t.timestamps
    end
    add_index :subscriptions, [:user_id, :subscribed_to_id, :subscribed_to_type], unique: true, name: "index_sub_subto_subcat"
  end
end
