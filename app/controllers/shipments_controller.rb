class ShipmentsController < ApplicationController
  def shipment_calculator

    # zip = params[:zip]
    ups = Shipment.ups_rates
    usps = Shipment.usps_rates
  end
end
