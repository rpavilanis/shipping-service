class RemoveFloatFromShipments < ActiveRecord::Migration
  def change
    remove_column :shipments, :float, :string
  end
end
