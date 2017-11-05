class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order

  def after_sign_in_path_for(resource)
    return checkout_index_path if session[:checkout] == true
    root_path
  end

  private

  def set_order
    @order = Order.find_by_id(session[:order_id])
    @order = Order.create(quantity: 0) unless @order
    session[:order_id] = @order.id
  end
end
