class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order

  private

  def set_order
    @order = Order.find_by_id(session[:order_id])
    @order = Order.create(quantity: 0) unless @order
    session[:order_id] = @order.id
  end
end
