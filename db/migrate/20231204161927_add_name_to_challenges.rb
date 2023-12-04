class AddNameToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :name, :string
  end
end
