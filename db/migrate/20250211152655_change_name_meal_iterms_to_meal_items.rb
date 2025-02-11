class ChangeNameMealItermsToMealItems < ActiveRecord::Migration[7.1]
  def change
    rename_table :meal_iterms, :meal_items
  end
end
