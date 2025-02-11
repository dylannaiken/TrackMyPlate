# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_02_11_153045) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_goals", force: :cascade do |t|
    t.integer "daily_calories"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "daily_proteins"
    t.integer "daily_carbs"
    t.integer "daily_fats"
    t.index ["user_id"], name: "index_daily_goals_on_user_id"
  end

  create_table "days", force: :cascade do |t|
    t.date "date"
    t.integer "total_calories"
    t.integer "total_proteins"
    t.integer "total_carbs"
    t.integer "total_fats"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_days_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.integer "food_group"
    t.text "description"
    t.bigint "nutrition_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nutrition_id"], name: "index_foods_on_nutrition_id"
    t.index ["user_id"], name: "index_foods_on_user_id"
  end

  create_table "meal_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "meal_id", null: false
    t.bigint "food_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_meal_items_on_food_id"
    t.index ["meal_id"], name: "index_meal_items_on_meal_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "name"
    t.integer "meal_type"
    t.bigint "day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_meals_on_day_id"
  end

  create_table "nutritions", force: :cascade do |t|
    t.integer "calories"
    t.integer "proteins"
    t.integer "carbs"
    t.integer "fats"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.integer "age"
    t.integer "weight"
    t.integer "height"
    t.integer "goal"
    t.integer "goal_weight"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_goals", "users"
  add_foreign_key "days", "users"
  add_foreign_key "foods", "nutritions"
  add_foreign_key "foods", "users"
  add_foreign_key "meal_items", "foods"
  add_foreign_key "meal_items", "meals"
  add_foreign_key "meals", "days"
end
