class RemoveStringFromShipments < ActiveRecord::Migration
  def change
    remove_column :shipments, :string, :string
  end
end
