class CartController < ApplicationController
  def index
    return redirect_back(fallback_location: root_path) unless @order.quantity > 0
  end
end
