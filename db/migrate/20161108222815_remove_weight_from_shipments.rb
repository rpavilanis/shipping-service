class RemoveWeightFromShipments < ActiveRecord::Migration
  def change
    remove_column :shipments, :weight, :string
  end
end
