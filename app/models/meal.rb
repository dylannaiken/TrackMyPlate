class Meal < ApplicationRecord
  belongs_to :user
  belongs_to :daily_log
  has_many :foods, dependent: :destroy
  # has_one_attached :photo

  after_save :update_daily_log_remaining_nutrients
  after_destroy :update_daily_log_remaining_nutrients
  enum meal_type: { breakfast: 0, lunch: 1, dinner: 2, snack: 3 }

  def total_calories
    foods.joins(:nutrition).sum('nutritions.calories')
  end

  def total_protein
    foods.joins(:nutrition).sum('nutritions.protein')
  end

  def total_carbs
    foods.joins(:nutrition).sum('nutritions.carbs')
  end

  def total_fat
    foods.joins(:nutrition).sum('nutritions.fat')
  end

  private

  def update_daily_log_remaining_nutrients
    daily_log.update_remaining_nutrients
  end
end
