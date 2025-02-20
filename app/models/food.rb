class Food < ApplicationRecord
  belongs_to :meal
  has_one :nutrition, dependent: :destroy
  has_one_attached :photo

  after_save :update_daily_log_remaining_calories
  after_destroy :update_daily_log_remaining_calories

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
end
