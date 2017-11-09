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
    reset_checkout unless @order.in_progress?
    @order = Order.create(quantity: 0) unless @order.in_progress?
    session[:order_id] = @order.id
    set_user_to_order unless @order.user
  end

  def set_user_to_order
    @order.update(user: current_user) if current_user
  end

  def reset_checkout
    session[:order_id] = nil
    session[:confirm] = nil
    session[:payment] = nil
    session[:shipping] = nil
    session[:addresses] = nil
  end
end
