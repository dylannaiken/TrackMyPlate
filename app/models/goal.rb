class Goal < ApplicationRecord
  belongs_to :user
  has_many :meals
  enum goal_type: { lose_weight: 0, gain_weight: 1, maintain_weight: 2 }

  def consumed_calories
    @meal = Meal.where(user_id: user_id).joins(foods: :nutrition).sum("nutritions.calories")
  end

  def consumed_protein
    Meal.where(user_id: user_id).joins(foods: :nutrition).sum("nutritions.protein")
  end

  def consumed_carbs
    Meal.where(user_id: user_id).joins(foods: :nutrition).sum("nutritions.carbs")
  end

  def consumed_fat
    Meal.where(user_id: user_id).joins(foods: :nutrition).sum("nutritions.fat")
  end

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "muest be after the start date")
    end
  end
end
