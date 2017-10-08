class OrderItemsController < ApplicationController

  def destroy
    order_item = OrderItem.find(params[:id])
    book = order_item.book
    quantity = order_item.quantity
    order_item.destroy
    book.quantity += quantity
    book.save
    @order.save
  end

  def update
    @order_item = OrderItem.find(params[:id])
    book = @order_item.book
    if(params[:increase] == 'true')
      return flash.now[:error] = t('out_of_stock') if(book.quantity == 0)
      @order_item.quantity += 1
      book.quantity -= 1
    elsif(params[:increase] == 'false')
      return if(@order_item.quantity == 1)
      @order_item.quantity -= 1
      book.quantity += 1
    end
    book.save
    @order_item.save
    @order.save
  end

  def create
    return flash.now[:error] = t('out_of_stock') if order_item_params[:quantity] == '0' || Book.find(order_item_params[:book_id]).quantity <= 0
    @order_item = @order.order_items.find_or_create_by(book_id: order_item_params[:book_id])
    @order_item.order_id = @order.id unless @order_item.persisted?
    book = @order_item.book
    if book.quantity >= order_item_params[:quantity].to_i
      @order_item.quantity += order_item_params[:quantity].to_i
      book.quantity -= order_item_params[:quantity].to_i
    end
    book.save
    @order_item.save
    @order_item.order.save
  end

  private

  def order_item_params
    params.require(:order_item).permit(:book_id, :quantity)
  end
end
