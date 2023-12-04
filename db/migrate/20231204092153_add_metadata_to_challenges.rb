class AddMetadataToChallenges < ActiveRecord::Migration[7.1]
  def change
    add_column :challenges, :metadata, :jsonb, default: {}, null: false
  end
end
