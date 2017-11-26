module OrdersHelper

  def secret_code
    @order.coupon.secret_code if @order.coupon
  end

  def orders_filters
    filters = Order.aasm(:status).states.map(&:name).unshift(:all)
    filters.delete(:in_progress)
    filters
  end

  def orders_current_filter
    filter = params[:filter]
    return orders_filters.first unless filter
    return orders_filters.first unless orders_filters.include? filter.to_sym
    filter
  end

  def ordered_orders
    @orders.send(orders_current_filter).order(updated_at: :asc)
  end
end
