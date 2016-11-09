class ShipmentsController < ApplicationController
# use information from model to create estimates to be passed to app
  def calculator
# define variable with params coming in from
    # weight = params[:weight]
    set_location = Shipment.destination( params[:country], params[:state], params[:city], params[:postal_code] )
# get rates for carriers and then put these rates into an array called shipping_rates
    shipping_rates_response = []
    shipping_rates_response << Shipment.ups_rates(set_location)
    shipping_rates_response << Shipment.usps_rates(set_location)
# render as_json if there is content provided
    if shipping_rates_response
        render :json => shipping_rates_response.as_json, :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def logger
    # should log all quotes that are made - not sure about requests?
    logs = Shipment.all

    if logs
        render :json => logs.as_json, :status => :ok
    else
      render :json => [], :status => :no_content
    end

  end


  def shipment_params
    params.permit(location: [:city, :state, :zip], package: [:weight])
  end
end
