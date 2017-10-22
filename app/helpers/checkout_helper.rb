module CheckoutHelper
  def current_delivery
    delivery = @order.delivery || @deliveries.order(:price).first
    delivery.id
  end
end
