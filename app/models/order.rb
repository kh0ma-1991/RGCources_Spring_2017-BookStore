class Order < ApplicationRecord
  has_many :order_items
  has_one :coupon
  before_save :set_quantity, :calculate

  private

  def set_quantity
    self.quantity = order_items.sum(:quantity)
  end

  def calculate
    self.subtotal = order_items.sum(:total_price)
    discount = coupon ? coupon.discount : 0
    self.total_price = subtotal*(1-discount)
  end
end
