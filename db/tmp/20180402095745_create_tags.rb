class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.String{12} :name
      t.references :verified_by, foreign_key: true
      t.references :rejected_by, foreign_key: true
      t.references :added_by, foreign_key: true

      t.timestamps
    end
  end
end
