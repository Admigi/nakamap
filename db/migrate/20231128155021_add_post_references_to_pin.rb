class AddPostReferencesToPin < ActiveRecord::Migration[7.1]
  def change
    add_reference :pins, :post, null: false, foreign_key: true
  end
end
