class CreateRecipePriceRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_price_ratings do |t|
      t.float :average_rating, default: 0
      t.timestamps
    end
  end
end
