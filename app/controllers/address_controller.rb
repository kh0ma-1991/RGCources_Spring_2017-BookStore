class AddressController < ApplicationController
  before_action :authenticate_user!

  def index
    @shipping  = current_user.shipping_address || ShippingAddress.new
    @billing   = current_user.billing_address  || BillingAddress .new
    'index'
  end

  def update_shipping
    @shipping = current_user.shipping_address || ShippingAddress.new(user: current_user)
    @shipping.update(address_params(:shipping_address))
    render index
  end

  def update_billing
    @billing  = current_user.billing_address  || BillingAddress .new(user: current_user)
    @billing.update(address_params(:billing_address))
    render index
  end

  private

  def address_params(type)
    params.require(type)
        .permit(:first_name,
                :last_name,
                :address,
                :city,
                :zip,
                :country,
                :phone)
  end
end