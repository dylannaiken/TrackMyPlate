class CreateDailyLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :daily_logs do |t|
      t.references :user, null: false, foreign_key: true
      t.date :log_date
      t.float :remaining_calories

      t.timestamps
    end
    add_index :daily_logs, [:user_id, :log_date]
  end
end
