class Goal < ApplicationRecord
  belongs_to :user
  enum goal_type: { lose_weight: 0, gain_weight: 1, maintain_weight: 2 }  

  private 

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date 
      errors.add(:end_date, "muest be after the start date")
    end
  end 

end


