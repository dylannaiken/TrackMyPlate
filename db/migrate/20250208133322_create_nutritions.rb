class CreateNutritions < ActiveRecord::Migration[7.1]
  def change
    create_table :nutritions do |t|
      t.integer :calories
      t.integer :proteins
      t.integer :carbs
      t.integer :fats

      t.timestamps
    end
  end
end
