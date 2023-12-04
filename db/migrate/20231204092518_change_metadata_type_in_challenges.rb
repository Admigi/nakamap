class ChangeMetadataTypeInChallenges < ActiveRecord::Migration[7.1]
  def up
    change_column :challenges, :metadata, :text
  end

  def down
    change_column :challenges, :metadata, :jsonb, default: {}, null: false
  end
end
