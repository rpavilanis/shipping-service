require 'active_shipping'

class Shipment < ActiveRecord::Base
before_action :find_address_info, only: [:origin, :destination]

SIZE = [5, 5, 5]

  def origin
    ActiveShipping::Location.new(country: "USA", state: "OR", city: "Eugene", zip: "97405")
  end

  def destination
    ActiveShipping::Location.new(country: location["country"], state: location["state_code"], city: location["city"], zip: location["zip"])
  end

  def packages
    package = ActiveShipping::Package.new(package["weight"], SIZE)

  end

  def get_rates_from_shipper(shipper)
    response = shipper.find_rates(origin, destination, packages)
    response.rates.sort_by(&:price).collect {|rate| [rate.service_name, rate.price]}

  end

  def self.ups_rates
    ups = ActiveShipping::UPS.new(login: ACTIVESHIPPING_UPS_LOGIN, password: ACTIVESHIPPING_UPS_PASSWORD, key: ACTIVESHIPPING_UPS_KEY)
    get_rates_from_shipper(ups)
  end

  def self.usps_rates
    usps = ActiveShipping::USPS.new(login: ACTIVESHIPPING_USPS_LOGIN, password: ACTIVESHIPPING_USPS_PWD)
    get_rates_from_shipper(usps)
  end

# private
# find info based on zip using gem
  # def find_address_info
  #   address = ZipCodes.identify(:zip)
  # end



end
