class Food < ApplicationRecord
  belongs_to :meal
  has_one :nutrition, dependent: :destroy
  has_one_attached :photo

  after_save :update_daily_log_remaining_nutrients

  after_destroy :update_daily_log_remaining_nutrients

  # enum serving_unit: {
  #   grams: 'grams'
  #   liters: 'liters'
  #   cups: 'cups'
  #   tablespoons: 'tablespoons'
  #   teaspoons: 'teaspoons'
  # }

  private

  def update_daily_log_remaining_nutrients
    meal.daily_log.update_remaining_nutrients
  end
end
