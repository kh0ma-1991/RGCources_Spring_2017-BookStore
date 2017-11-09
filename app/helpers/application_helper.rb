module ApplicationHelper
  def price_in_currency(price)
    number_to_currency(price, unit: '€')
  end

  def discount
    if coupon = @order.coupon
      return  @order.subtotal * coupon.discount
    end
    0
  end

  def shipping_price
    delivery = @order.delivery
    delivery ? delivery.price : 0
  end

  def order_code order
    id = order.id.to_s
    return '#R'+id if id.length >= 9
    '#R00000000'.slice(0,10-id.length)+id
  end
end
