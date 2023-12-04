class ChangeDefaultPointsInUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :points, :integer, default: 0
  end
end
