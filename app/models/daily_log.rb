class DailyLog < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy

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
    consumed1 = total_calories
    daily_target1 = user.goal.daily_calorie_target
    update(remaining_calories: daily_target1 - consumed1)
  end

  def update_remaining_protein
    consumed = total_protein
    daily_target = user.goal.protein_target
    update(remaining_proteins: daily_target - consumed)
  end

  def update_remaining_carbs
    consumed = total_carbs
    daily_target = user.goal.carbs_target
    update(remaining_carbs: daily_target - consumed)
  end

  def update_remaining_fat
    consumed = total_fat
    daily_target = user.goal.fat_target
    update(remaining_fats: daily_target - consumed)
  end
end
