class CreateTagNames < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_names do |t|
      t.string :name, limit: 20, null: false
      t.index :name, unique: true
      t.timestamps
    end
  end
end
