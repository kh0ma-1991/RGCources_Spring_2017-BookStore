class Order < ApplicationRecord
  has_many :order_items
  before_save :set_quantity

  private

  def set_quantity
    self.quantity = order_items.sum(:quantity)
  end
end
