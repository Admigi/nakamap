class ChangeQuestionsDataTypeInChallenges < ActiveRecord::Migration[7.1]
  def up
    change_column :challenges, :questions, :text
  end

  def down
    change_column :challenges, :questions, :string
  end
end
