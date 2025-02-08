class CreateDailyGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_goals do |t|
      t.integer :daily_calories
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
