module OrdersHelper

  def secret_code
    @order.coupon.secret_code if @order.coupon
  end
end
