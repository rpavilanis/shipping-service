require 'active_shipping'

class Shipment < ActiveRecord::Base
SIZE = [10, 10, 10]
ORIGIN = ActiveShipping::Location.new(country: "US", state: "OR", city: "Eugene", postal_code: "97405")

  # def self.origin
  #   ActiveShipping::Location.new(country: "USA", state: "OR", city: "Eugene", zip: "97405")
  # end

  def self.destination(country, state, city, postal_code)
    ActiveShipping::Location.new(country: country, state: state, city: city, postal_code: postal_code)
  end

  def self.packages(weight)
    ActiveShipping::Package.new(weight, SIZE)
  end

  def self.get_rates_from_shipper(shipper, set_destination, weight)
    shipper.find_rates(ORIGIN, set_destination, packages(weight))
    # This returns an array of arrays - don't think we actually want to return this, even though it seems cleaner on this end - better to allow app to choose what to display/use?
    # response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}
  end

  def self.ups_rates(set_destination, weight)
    ups = ActiveShipping::UPS.new(login: ENV["ACTIVESHIPPING_UPS_LOGIN"], password: ENV["ACTIVESHIPPING_UPS_PASSWORD"], key: ENV["ACTIVESHIPPING_UPS_KEY"])
    get_rates_from_shipper(ups, set_destination, weight)
  end

  def self.usps_rates(set_destination, weight)
    usps = ActiveShipping::USPS.new(login: ENV["ACTIVESHIPPING_USPS_LOGIN"])
    get_rates_from_shipper(usps, set_destination, weight)
  end

end
