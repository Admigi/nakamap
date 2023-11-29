class AddColumnAddressToPin < ActiveRecord::Migration[7.1]
  def change
    add_column :pins, :address, :string
  end
end
