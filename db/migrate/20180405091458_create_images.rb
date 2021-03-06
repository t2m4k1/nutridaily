class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :name, limit: 30, null: false
      t.string :path, null: false
      t.integer :rating, default: 0
      t.references :depicted, polymorphic: true
      t.string :depicted_type
      t.references :added_by, references: :user, null: false
      t.timestamps
    end
    add_index :images, [:path, :depicted_id , :depicted_type], unique: true
  end
end
