class AddQuestionsToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :questions, :text
  end
end
