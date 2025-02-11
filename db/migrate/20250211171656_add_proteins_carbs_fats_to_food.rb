class AddProteinsCarbsFatsToFood < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :proteins, :integer
    add_column :foods, :carbs, :integer
    add_column :foods, :fats, :integer
  end
end
