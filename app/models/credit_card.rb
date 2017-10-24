class CreditCard < ApplicationRecord
  belongs_to :order

  validates :name, :number, :cvv, :expiration_date, presence: true
  validates_format_of :number,
                      with: /\A\d{4}\s\d{4}\s\d{4}\s\d{4}\z/,
                      allow_blank: true,
                      message: :only_digits
  validates_format_of :name,
                      with: /\A[a-z,а-яєіїё,\s]+\z/xi,
                      allow_blank: true,
                      message: :only_letters
  validates :name,
            length: { maximum: 50 },
            allow_blank: true
  validates_format_of :expiration_date,
                      with: /\A(0?[1-9]|1[012])\s\/\s[1-9]{2}\z/,
                      allow_blank: true,
                      message: :expiry_format
  validates :cvv,
            length: { minimum: 3 },
            allow_blank: true
end
