class Goal < ApplicationRecord
  belongs_to :user
  enum goal_type: { lose_weight: 0, gain_weight: 1, maintain_weight: 2 }

  # On calcule tous les nutriments avec une seule requete
  def consumed_nutrients
    user.daily_logs.joins(meals: { foods: :nutrition })
        .select("SUM(nutritions.calories) AS calories,
                 SUM(nutritions.protein) AS protein,
                 SUM(nutritions.carbs) AS carbs,
                 SUM(nutritions.fat) AS fat")
        .first
  end

  # Methodes pour avoir accés a chaque nutriment séparement
  def consumed_calories
    consumed_nutrients.calories || 0
  end

  def consumed_protein
    consumed_nutrients.protein || 0
  end

  def consumed_carbs
    consumed_nutrients.carbs || 0
  end

  def consumed_fat
    consumed_nutrients.fat || 0
  end

  # On valide que le end date est apres la start date
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
