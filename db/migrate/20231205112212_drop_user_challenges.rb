class DropUserChallenges < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_challenges
  end
end
