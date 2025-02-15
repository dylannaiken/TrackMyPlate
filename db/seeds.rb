# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Création d'utilisateurs

puts "Creating users..."
user1 = User.find_or_create_by!(email: "dylan@admin.com") { |u| u.password = "password" }
user2 = User.find_or_create_by!(email: "dorian@admin.com") { |u| u.password = "password" }
user3 = User.find_or_create_by!(email: "memphis@admin.com") { |u| u.password = "password" }
user4 = User.find_or_create_by!(email: "dilshad@admin.com") { |u| u.password = "password" }

puts "Creating goals..."
[ user1, user2, user3, user4 ].each_with_index do |user, index|
  Goal.find_or_create_by!(user: user) do |goal|
    goal.goal_type = index.zero? ? 0 : 1
    goal.target_weight = 80
    goal.daily_calorie_target = 2500
    goal.protein_target = 120
    goal.carbs_target = 300
    goal.fat_target = 80
    goal.start_date = Date.today
    goal.end_date = Date.today + 30
    goal.is_active = true
  end
end

puts "Creating daily logs..."
daily_logs = {}
[ user1, user2, user3, user4 ].each do |user|
  daily_logs[user] = DailyLog.find_or_create_by!(user: user, log_date: Date.today) do |log|
    log.remaining_calories = 500
  end
end

puts "Creating meals..."
meal1 = Meal.find_or_create_by!(user: user1, daily_log: daily_logs[user1], meal_type: 0) { |m| m.eaten_at = Time.current }
meal2 = Meal.find_or_create_by!(user: user2, daily_log: daily_logs[user2], meal_type: 1) { |m| m.eaten_at = Time.current }
meal3 = Meal.find_or_create_by!(user: user1, daily_log: daily_logs[user1], meal_type: 0) { |m| m.eaten_at = Time.current }
meal4 = Meal.find_or_create_by!(user: user1, daily_log: daily_logs[user1], meal_type: 0) { |m| m.eaten_at = Time.current }

puts "Creating foods..."
food1 = Food.find_or_create_by!(meal: meal1, food_name: "Poulet grillé", serving_size: 100, serving_unit: "g")
food2 = Food.find_or_create_by!(meal: meal2, food_name: "Riz", serving_size: 200, serving_unit: "g")
food3 = Food.find_or_create_by!(meal: meal3, food_name: "Carbonara", serving_size: 249, serving_unit: "g")
food4 = Food.find_or_create_by!(meal: meal4, food_name: "Burgouz", serving_size: 100, serving_unit: "g")

puts "Creating nutrition details..."
{
  food1 => { calories: 300, protein: 35, carbs: 0, fat: 8, fiber: 0, sugar: 0, sodium: 500, cholesterol: 80, additional_nutrients: { iron: 2, vitamin_c: 0 } },
  food2 => { calories: 250, protein: 5, carbs: 55, fat: 1, fiber: 2, sugar: 0, sodium: 10, cholesterol: 0, additional_nutrients: { iron: 1, vitamin_c: 0 } },
  food3 => { calories: 250, protein: 5, carbs: 55, fat: 1, fiber: 2, sugar: 0, sodium: 10, cholesterol: 0, additional_nutrients: { iron: 1, vitamin_c: 0 } },
  food4 => { calories: 300, protein: 35, carbs: 0, fat: 8, fiber: 0, sugar: 0, sodium: 500, cholesterol: 80, additional_nutrients: { iron: 2, vitamin_c: 0 } }
}.each do |food, nutrition|
  Nutrition.find_or_create_by!(food: food) do |n|
    n.attributes = nutrition
  end
end

puts "Seeding completed!"
