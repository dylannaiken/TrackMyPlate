class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :daily_log, null: false, foreign_key: true
      t.integer :meal_type
      t.datetime :eaten_at

      t.timestamps
    end
    add_index :meals, [:user_id, :daily_log_id]
    add_index :meals, :eaten_at
  end
end
