class Order < ApplicationRecord
  has_many :order_items
  before_save :set_quantity, :calculate

  private

  def set_quantity
    self.quantity = order_items.sum(:quantity)
  end

  def calculate
    self.subtotal = order_items.sum(:total_price)
    self.total_price = subtotal
  end
end
