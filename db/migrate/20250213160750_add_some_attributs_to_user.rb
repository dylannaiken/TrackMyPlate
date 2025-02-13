class AddSomeAttributsToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :fullname, :string
    add_column :users, :age, :integer
    add_column :users, :weight, :integer
    add_column :users, :height, :integer
  end
end
