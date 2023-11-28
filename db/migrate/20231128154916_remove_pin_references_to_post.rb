class RemovePinReferencesToPost < ActiveRecord::Migration[7.1]
  def change
    remove_reference :posts, :pin, foreign_key: true
  end
end
