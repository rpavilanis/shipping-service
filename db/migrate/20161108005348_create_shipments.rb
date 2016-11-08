class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :request
      t.string :weight
      t.string :float
      t.string :response
      t.string :string

      t.timestamps null: false
    end
  end
end
