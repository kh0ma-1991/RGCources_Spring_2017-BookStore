class OrderItem < ApplicationRecord
  belongs_to :book
  belongs_to :order
  
  before_save :set_price

  private

  def set_price
    self.quantity = 0 unless self.persisted?
    self.total_price = book.price*quantity
  end
end
