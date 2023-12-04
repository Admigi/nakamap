class AddSelectedOptionToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :selected_option, :string
  end
end
