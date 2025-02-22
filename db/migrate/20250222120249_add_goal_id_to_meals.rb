class AddGoalIdToMeals < ActiveRecord::Migration[7.1]
  def change
    add_reference :meals, :goal, foreign_key: true
  end
end
