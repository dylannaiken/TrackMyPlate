class CreateDays < ActiveRecord::Migration[7.1]
  def change
    create_table :days do |t|
      t.date :date
      t.integer :total_calories
      t.integer :total_proteins
      t.integer :total_carbs
      t.integer :total_fats
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
