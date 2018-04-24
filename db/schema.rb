# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180424161756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cook_book_recipes", force: :cascade do |t|
    t.bigint "cook_book_id", null: false
    t.bigint "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cook_book_id", "recipe_id"], name: "index_cook_book_recipes_on_cook_book_id_and_recipe_id", unique: true
    t.index ["cook_book_id"], name: "index_cook_book_recipes_on_cook_book_id"
    t.index ["recipe_id"], name: "index_cook_book_recipes_on_recipe_id"
  end

  create_table "cook_books", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.bigint "added_by_id", null: false
    t.boolean "private", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_cook_books_on_added_by_id"
    t.index ["name", "added_by_id", "private"], name: "index_cook_books_on_name_and_added_by_id_and_private", unique: true
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_countries_on_name", unique: true
  end

  create_table "derived_measurements", force: :cascade do |t|
    t.string "name", null: false
    t.integer "amountInPercent", null: false
    t.bigint "nutritional_info_id", null: false
    t.bigint "added_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_derived_measurements_on_added_by_id"
    t.index ["name", "nutritional_info_id"], name: "index_derived_measurements_on_name_and_nutritional_info_id", unique: true
    t.index ["nutritional_info_id"], name: "index_derived_measurements_on_nutritional_info_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "name", limit: 30, null: false
    t.string "path", null: false
    t.integer "rating", default: 0
    t.string "depicted_type"
    t.bigint "depicted_id"
    t.bigint "added_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_images_on_added_by_id"
    t.index ["depicted_type", "depicted_id"], name: "index_images_on_depicted_type_and_depicted_id"
    t.index ["path", "depicted_id", "depicted_type"], name: "index_images_on_path_and_depicted_id_and_depicted_type", unique: true
  end

  create_table "ingredient_countries", force: :cascade do |t|
    t.bigint "ingredient_id", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_ingredient_countries_on_country_id"
    t.index ["ingredient_id", "country_id"], name: "index_ingredient_countries_on_ingredient_id_and_country_id", unique: true
    t.index ["ingredient_id"], name: "index_ingredient_countries_on_ingredient_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.bigint "added_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_ingredients_on_added_by_id"
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "nutritional_infos", force: :cascade do |t|
    t.string "unit", null: false
    t.integer "kcal", null: false
    t.float "protein", null: false
    t.float "carbohydrates", null: false
    t.float "sugar", null: false
    t.float "fat", null: false
    t.float "saturates", null: false
    t.float "salt", null: false
    t.float "fibre"
    t.float "alcohol"
    t.bigint "ingredient_id", null: false
    t.bigint "added_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_nutritional_infos_on_added_by_id"
    t.index ["ingredient_id", "unit"], name: "index_nutritional_infos_on_ingredient_id_and_unit", unique: true
    t.index ["ingredient_id"], name: "index_nutritional_infos_on_ingredient_id"
  end

  create_table "recipe_price_ratings", force: :cascade do |t|
    t.float "average_rating", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.integer "number"
    t.text "description", null: false
    t.integer "duration", null: false
    t.float "measurement_multiplier"
    t.bigint "recipe_id"
    t.bigint "info_or_measurement_id"
    t.string "info_or_measurement_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["info_or_measurement_id"], name: "index_recipe_steps_on_info_or_measurement_id"
    t.index ["recipe_id", "number"], name: "index_recipe_steps_on_recipe_id_and_number", unique: true
    t.index ["recipe_id"], name: "index_recipe_steps_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", limit: 50, null: false
    t.integer "serving_count", null: false
    t.bigint "price_category_id", null: false
    t.boolean "is_drink", default: false
    t.boolean "is_private", default: false
    t.bigint "added_by_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["added_by_id"], name: "index_recipes_on_added_by_id"
    t.index ["name", "added_by_id", "is_private"], name: "index_recipe_name_addedby_priv", unique: true
    t.index ["price_category_id"], name: "index_recipes_on_price_category_id"
  end

  create_table "remember_digests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "digest", null: false
    t.datetime "last_login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "digest"], name: "index_remember_digests_on_user_id_and_digest", unique: true
    t.index ["user_id"], name: "index_remember_digests_on_user_id"
  end

  create_table "report_cases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "reported_type"
    t.bigint "reported_id"
    t.bigint "report_category_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_category_id"], name: "index_report_cases_on_report_category_id"
    t.index ["reported_type", "reported_id"], name: "index_report_cases_on_reported_type_and_reported_id"
    t.index ["user_id", "reported_id", "reported_type", "report_category_id"], name: "index_report_cases", unique: true
    t.index ["user_id"], name: "index_report_cases_on_user_id"
  end

  create_table "report_categories", force: :cascade do |t|
    t.string "name"
    t.string "reported_type", null: false
    t.integer "score_impact"
    t.integer "minimum_score"
    t.integer "minimum_permission_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_report_categories_on_name"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subscribed_to_type"
    t.bigint "subscribed_to_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subscribed_to_type", "subscribed_to_id"], name: "index_subscriptions_on_subscribed_to_type_and_subscribed_to_id"
    t.index ["user_id", "subscribed_to_id", "subscribed_to_type"], name: "index_sub_subto_subcat", unique: true
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "tag_names", force: :cascade do |t|
    t.string "name", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tag_names_on_name", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "tag_name_id", null: false
    t.string "tagged_type"
    t.bigint "tagged_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_name_id", "tagged_id", "tagged_type"], name: "index_tags_on_tag_name_id_and_tagged_id_and_tagged_type", unique: true
    t.index ["tag_name_id"], name: "index_tags_on_tag_name_id"
    t.index ["tagged_type", "tagged_id"], name: "index_tags_on_tagged_type_and_tagged_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "authentication_id"
    t.string "name", limit: 25, null: false
    t.string "email", limit: 50, null: false
    t.string "password_digest", null: false
    t.bigint "country_id", null: false
    t.text "biography"
    t.boolean "verified_email", default: false
    t.integer "score", default: 0
    t.integer "permission_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["authentication_id"], name: "index_users_on_authentication_id", unique: true
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["name"], name: "index_users_on_name", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "voted_on_type"
    t.bigint "voted_on_id"
    t.integer "rating", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "voted_on_id", "voted_on_type"], name: "index_votes_on_user_id_and_voted_on_id_and_voted_on_type", unique: true
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voted_on_type", "voted_on_id"], name: "index_votes_on_voted_on_type_and_voted_on_id"
  end

end
