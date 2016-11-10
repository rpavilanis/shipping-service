class ShipmentsController < ApplicationController
after_action :logger
    # use information from model to create estimates to be passed to app
  def calculator
    # define variables with params coming in from app
    # set_package = Shipment.packages( params[:weight], params[:size])
    weight = params[:weight].to_i
    set_destination = Shipment.destination( params[:country], params[:state], params[:city], params[:postal_code] )
    # get rates for carriers and then put these rates into an array called shipping_rates
    @shipping_rates_response = []
    @shipping_rates_response << Shipment.ups_rates(set_destination, weight)
    @shipping_rates_response << Shipment.usps_rates(set_destination, weight)
    # render as_json if there is content provided
    if @shipping_rates_response
        render :json => @shipping_rates_response.as_json, :status => :ok
    else
      render :json => [], :status => :no_content
    end
  end

  def logger
    # logs all requests and responses
    @response = @shipping_rates_response
    @request = {
     country: params[:country],
     city: params[:city],
     state: params[:state],
     postal_code: params[:postal_code], weight: params[:weight]}
     Shipment.create(response: @response, request: @request)

  end
end
