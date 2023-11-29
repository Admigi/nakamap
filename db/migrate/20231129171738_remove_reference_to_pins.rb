class RemoveReferenceToPins < ActiveRecord::Migration[7.1]
  def change
    remove_reference :pins, :post, foreign_key: true
  end
end
