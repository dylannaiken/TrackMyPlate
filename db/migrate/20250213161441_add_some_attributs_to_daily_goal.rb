class AddSomeAttributsToDailyGoal < ActiveRecord::Migration[7.1]
  def change
    add_column :daily_logs, :remaining_proteins, :integer
    add_column :daily_logs, :remaining_carbs, :integer
    add_column :daily_logs, :remaining_fats, :integer
    add_column :daily_logs, :remaining_water, :integer
  end
end
