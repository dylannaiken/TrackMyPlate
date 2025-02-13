class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.references :meal, null: false, foreign_key: true
      t.string :food_name
      t.float :serving_size
      t.string :serving_unit

      t.timestamps
    end
  end
end
