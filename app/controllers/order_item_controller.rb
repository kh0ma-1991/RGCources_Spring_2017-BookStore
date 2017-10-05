class OrderItemController < ApplicationController

  def delete
  end

  def update
  end

  def create
    order_item = @order.order_items.find_by(book_id: params[:book_id])
    order_item = OrderItem.new(order_item_params) unless order_item
    order_item.order_id = @order.id
    order_item.quantity += order_item_params[:quantity].to_i if order_item.persisted?
    order_item.save
    order_save
  end

  private

  def order_item_params
    params.permit(:book_id, :quantity)
  end

  def order_save
    @order.save
  end
end
