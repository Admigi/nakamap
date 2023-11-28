class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :content
      t.string :multimedia
      t.references :pin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
