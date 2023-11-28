class CreateUserbadges < ActiveRecord::Migration[7.1]
  def change
    create_table :userbadges do |t|
      t.string :name
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :badge, null: false, foreign_key: true

      t.timestamps
    end
  end
end
