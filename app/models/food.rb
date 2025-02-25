class Food < ApplicationRecord
  belongs_to :meal
  has_one :nutrition, dependent: :destroy
  has_one_attached :photo

  after_save :update_daily_log_remaining_calories,
             :update_daily_log_remaining_protein,
             :update_daily_log_remaining_carbs,
             :update_daily_log_remaining_fat

  after_destroy :update_daily_log_remaining_calories,
                :update_daily_log_remaining_protein,
                :update_daily_log_remaining_carbs,
                :update_daily_log_remaining_fat

  # enum serving_unit: {
  #   grams: 'grams'
  #   liters: 'liters'
  #   cups: 'cups'
  #   tablespoons: 'tablespoons'
  #   teaspoons: 'teaspoons'
  # }

  private

  def update_daily_log_remaining_calories
    meal.daily_log.update_remaining_calories
  end

  def update_daily_log_remaining_protein
    meal.daily_log.update_remaining_protein
  end

  def update_daily_log_remaining_carbs
    meal.daily_log.update_remaining_carbs
  end

  def update_daily_log_remaining_fat
    meal.daily_log.update_remaining_fat
  end
end
