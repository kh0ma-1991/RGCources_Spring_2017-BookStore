class Address < ApplicationRecord
  belongs_to :order, optional: true

  scope :billing,  -> { where(type: 'BillingAddress')  }
  scope :shipping, -> { where(type: 'ShippingAddress') }

  def country_name
    country_iso = ISO3166::Country[country]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end
end
