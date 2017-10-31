class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_order

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  private

  def set_order
    @order = Order.find_by_id(session[:order_id])
    @order = Order.create(quantity: 0) unless @order
    session[:order_id] = @order.id
  end
end
