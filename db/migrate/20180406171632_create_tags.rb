class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.references :tag_name, null: false
      t.references :tagged, polymorphic: true
      t.string :tagged_type
      t.timestamps
    end
    add_index :tags, [:tag_name_id, :tagged_id , :tagged_type], unique: true
  end
end
