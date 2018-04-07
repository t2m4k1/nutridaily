class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name, limit:12, null: false
      t.references :added_by, references: :user, null: false
      t.references :tagged, polymorphic: true
      t.string :tagged_type
      t.timestamps
    end
    add_index :tags, [:name, :tagged_id , :tagged_type], unique: true
  end
end
