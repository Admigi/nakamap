class DropQuestionsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :questions
  end
end
