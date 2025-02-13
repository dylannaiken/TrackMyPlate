class CreateNutritions < ActiveRecord::Migration[7.1]
  def change
    create_table :nutritions do |t|
      t.references :food, null: false, foreign_key: true
      t.float :calories
      t.float :protein
      t.float :carbs
      t.float :fat
      t.float :fiber
      t.float :sugar
      t.float :sodium
      t.float :cholesterol
      t.json :additional_nutrients

      t.timestamps
    end
  end
end
