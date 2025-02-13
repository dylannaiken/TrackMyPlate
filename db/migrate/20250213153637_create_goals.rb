class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :goal_type
      t.float :target_weight
      t.integer :daily_calorie_target
      t.float :protein_target
      t.float :carbs_target
      t.float :fat_target
      t.date :start_date
      t.date :end_date
      t.boolean :is_active

      t.timestamps
    end
    add_index :goals, [:user_id, :is_active]
  end
end
