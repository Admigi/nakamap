class ChangePointToPoints < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :point, :points
  end
end
