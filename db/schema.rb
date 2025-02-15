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

ActiveRecord::Schema[7.1].define(version: 2025_02_15_112100) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daily_logs", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "log_date"
    t.float "remaining_calories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "remaining_proteins"
    t.integer "remaining_carbs"
    t.integer "remaining_fats"
    t.integer "remaining_water"
    t.index ["user_id", "log_date"], name: "index_daily_logs_on_user_id_and_log_date"
    t.index ["user_id"], name: "index_daily_logs_on_user_id"
  end

  create_table "foods", force: :cascade do |t|
    t.bigint "meal_id", null: false
    t.string "food_name"
    t.float "serving_size"
    t.string "serving_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_foods_on_meal_id"
  end

  create_table "goals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "goal_type"
    t.float "target_weight"
    t.integer "daily_calorie_target"
    t.float "protein_target"
    t.float "carbs_target"
    t.float "fat_target"
    t.date "start_date"
    t.date "end_date"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "target_water"
    t.index ["user_id", "is_active"], name: "index_goals_on_user_id_and_is_active"
    t.index ["user_id"], name: "index_goals_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "daily_log_id", null: false
    t.integer "meal_type"
    t.datetime "eaten_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["daily_log_id"], name: "index_meals_on_daily_log_id"
    t.index ["eaten_at"], name: "index_meals_on_eaten_at"
    t.index ["user_id", "daily_log_id"], name: "index_meals_on_user_id_and_daily_log_id"
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "nutritions", force: :cascade do |t|
    t.bigint "food_id", null: false
    t.float "calories"
    t.float "protein"
    t.float "carbs"
    t.float "fat"
    t.float "fiber"
    t.float "sugar"
    t.float "sodium"
    t.float "cholesterol"
    t.json "additional_nutrients"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["food_id"], name: "index_nutritions_on_food_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "ingredients"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "daily_logs", "users"
  add_foreign_key "foods", "meals"
  add_foreign_key "goals", "users"
  add_foreign_key "meals", "daily_logs"
  add_foreign_key "meals", "users"
  add_foreign_key "nutritions", "foods"
end
