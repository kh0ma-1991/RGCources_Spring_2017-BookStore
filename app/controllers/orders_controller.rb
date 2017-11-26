class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]

  def index
    @orders = current_user
                  .orders
                  .where
                  .not(status: :in_progress)
                  .all
  end

  def update
    coupon = Coupon.find_by(coupon_params)
    return flash.now[:error] = t('wrong_coupon') unless coupon
    return flash.now[:error] = t('used_coupon') if coupon.used
    @order.coupon = coupon
    @order.save
  end

  def show
    @order_show = Order.find(params[:id])
    redirect_to orders_path if @order_show.in_progress?
  end

  private

  def coupon_params
    params.permit(:secret_code)
  end
end
