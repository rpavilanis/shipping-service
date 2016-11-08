require 'active_shipping'

class Shipment < ActiveRecord::Base
# before_action :find_address_info, only: [:origin, :destination]
SIZE = [10, 10, 10]

  # def as_json( options = {})
  #   options = options.merge only: []
  #   super(options)
  # end

  def self.origin
    ActiveShipping::Location.new(country: "USA", state: "OR", city: "Eugene", zip: "97405")
  end

  def self.destination
    ActiveShipping::Location.new(country: "USA", state: params[:state], city: params[:city], zip: params[:zip])
  end

  def self.packages
   ActiveShipping::Package.new(weight: params[:weight], SIZE)
  end

  def self.get_rates_from_shipper(shipper)
    shipper.find_rates(origin, destination, packages)
    # This returns an array of arrays - don't think we actually want to return this, even though it seems cleaner on this end - better to allow app to choose what to display/use.   response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}
  end

  def self.ups_rates
    ups = ActiveShipping::UPS.new(login: ENV["ACTIVESHIPPING_UPS_LOGIN"], password: ENV["ACTIVESHIPPING_UPS_PASSWORD"], key: ENV["ACTIVESHIPPING_UPS_KEY"])
    get_rates_from_shipper(ups)
  end

  def self.usps_rates
    usps = ActiveShipping::USPS.new(login: ENV["ACTIVESHIPPING_USPS_LOGIN"])
    get_rates_from_shipper(usps)
  end

# private
# find info based on zip using gem
  # def find_address_info
  #   address = ZipCodes.identify(:zip)
  # end
end
