module ApplicationHelper
  def price_in_currency(price)
    number_to_currency(price, unit: '€')
  end

  def discount(order)
    if coupon = order.coupon
      return  order.subtotal * coupon.discount
    end
    0
  end

  def shipping_price(order)
    delivery = order.delivery
    delivery ? delivery.price : 0
  end
end
