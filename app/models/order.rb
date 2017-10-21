class Order < ApplicationRecord
  include AASM

  has_many :order_items
  has_one :coupon
  has_one :shipping_address
  has_one :billing_address
  before_save :set_quantity, :calculate

  aasm :status do
    state :in_progress, initial: true
    state :in_queue
    state :delivering
    state :done

    event :checkout do
      transitions from: :in_progress, to: :in_queue
    end

    event :start_delivery do
      transitions from: :in_queue, to: :delivering
    end

    event :complete do
      transitions from: :delivering, to: :done
    end
  end

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
