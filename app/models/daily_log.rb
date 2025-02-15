class DailyLog < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
end

def total_calories
  meals.sum(&:total_calories)
end

def total_protein
  meals.sum(&:total_protein)
end 

def total_carbs
  meals.sum(&:total_carbs)
end 

def total_fat
  meals.sum(&:total_fat)
end 

def update_remaining_calories
  consumed = total_calories 
  daily_target = user.goal.daily_calorie_target
  update(remaining_calories: daily_target - consumed)
end 