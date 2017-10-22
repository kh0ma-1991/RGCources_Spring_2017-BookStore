class Address < ApplicationRecord
  belongs_to :order, optional: true

  scope :billing,  -> { where(type: 'BillingAddress')  }
  scope :shipping, -> { where(type: 'ShippingAddress') }

  validates :first_name, :last_name, :address, :country, :zip, :phone, :city,
            presence: true
  validates_format_of :first_name, :last_name, :city, :country,
                      with: /\A[a-z,а-яєіїё]+\z/i,
                      allow_blank: true,
                      message: :only_letters
  validates_format_of :address,
                      with: /\A[a-z,а-яєіїё,0-9,\,,\-,_ , \.]+\z/i,
                      allow_blank: true,
                      message: :address_valid
  validates :first_name, :last_name, :address, :country, :city,
            length: { maximum: 50 },
            allow_blank: true
  validates :zip,
            length: { maximum: 10 },
            numericality: true,
            allow_blank: true
  validates :phone,
            length: { maximum: 15 },
            numericality: true,
            allow_blank: true
  validates_format_of :phone,
                      with: /\A\+.*\z/i,
                      message: :start_with_plus_sign
  def country_name
    country_iso = ISO3166::Country[self.country]
    country_iso.translations[I18n.locale.to_s] || country_iso.name
  end
end
