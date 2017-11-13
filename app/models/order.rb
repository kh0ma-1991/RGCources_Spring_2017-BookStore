class Order < ApplicationRecord
  include AASM

  has_many :order_items, dependent: :destroy
  has_one :coupon, dependent: :destroy
  has_one :shipping_address, dependent: :destroy
  has_one :billing_address, dependent: :destroy
  has_one :credit_card, dependent: :destroy
  belongs_to :delivery, optional: true
  belongs_to :user, optional: true
  before_save :set_quantity, :calculate

  aasm :status do
    state :in_progress, initial: true
    state :in_queue, after_enter: :send_email
    state :delivering
    state :done
    state :canceled

    event :checkout do
      transitions from: :in_progress, to: :in_queue
    end

    event :start_delivery do
      transitions from: :in_queue, to: :delivering
    end

    event :complete do
      transitions from: :delivering, to: :done
    end

    event :cancel do
      transitions from: [:in_queue, :delivering], to: :canceled
    end
  end

  def code
    id = self.id.to_s
    return '#R'+id if id.length >= 9
    '#R00000000'.slice(0,10-id.length)+id
  end

  private

  def send_email
    OrdersMailer.order_in_quee(self.id).deliver_later
  end

  def set_quantity
    self.quantity = order_items.sum(:quantity)
  end

  def calculate
    self.subtotal = order_items.sum(:total_price)
    discount = coupon ? coupon.discount : 0
    delivery_price = self.delivery ? self.delivery.price : 0
    self.total_price = subtotal*(1-discount) + delivery_price
  end
end
