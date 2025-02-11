class AddCaloriesToFood < ActiveRecord::Migration[7.1]
  def change
    add_column :foods, :calories, :integer
  end
end
