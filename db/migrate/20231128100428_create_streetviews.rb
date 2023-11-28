class CreateStreetviews < ActiveRecord::Migration[7.1]
  def change
    create_table :streetviews do |t|
      t.string :street_url
      t.string :audio_url
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
