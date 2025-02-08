class CreateMealIterms < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_iterms do |t|
      t.integer :quantity
      t.references :meal, null: false, foreign_key: true
      t.references :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end
