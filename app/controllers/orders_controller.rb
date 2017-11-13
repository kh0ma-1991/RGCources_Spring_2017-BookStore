class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def update
    coupon = Coupon.find_by(coupon_params)
    return flash.now[:error] = t('wrong_coupon') unless coupon
    return flash.now[:error] = t('used_coupon') if coupon.used
    @order.coupon = coupon
    @order.save
  end

  private

  def coupon_params
    params.permit(:secret_code)
  end
end
