class AddWaterTargetToGoal < ActiveRecord::Migration[7.1]
  def change
    add_column :goals, :target_water, :integer
  end
end
