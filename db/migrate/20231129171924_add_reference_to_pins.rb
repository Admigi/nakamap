class AddReferenceToPins < ActiveRecord::Migration[7.1]
  def change
    add_reference :pins, :post, null: true, foreign_key: true
  end
end
