class Address < ApplicationRecord
  belongs_to :order, optional: true

  scope :billing,  -> { where(type: 'BillingAddress')  }
  scope :shipping, -> { where(type: 'ShippingAddress') }
end
