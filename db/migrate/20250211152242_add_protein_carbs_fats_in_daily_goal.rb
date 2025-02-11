class AddProteinCarbsFatsInDailyGoal < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_goals, :daily_proteins, :integer
    add_column :daily_goals, :daily_carbs, :integer
    add_column :daily_goals, :daily_fats, :integer
  end
end
