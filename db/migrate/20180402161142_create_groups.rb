class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :name, limit:35, null: false
      t.index :name, unique: true
      t.boolean :system_group, null: false
      t.timestamps
    end
  end
end
