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

  def update_remaining_nutrients
    return unless user.goal

    update(
      remaining_calories: user.goal.daily_calorie_target - total_calories,
      remaining_proteins: user.goal.protein_target - total_protein,
      remaining_carbs: user.goal.carbs_target - total_carbs,
      remaining_fats: user.goal.fat_target - total_fat
    )
  end
end
