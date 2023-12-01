class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.text :question
      t.string :option_a
      t.string :option_b
      t.string :option_c
      t.string :correct_option

      t.timestamps
    end
  end
end
