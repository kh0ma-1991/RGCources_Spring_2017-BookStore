class OrdersMailer < ApplicationMailer
  def order_in_quee(order_id)
    @order_to_mail = Order.find_by_id(order_id)
    mail(to: @order_to_mail.user.email, subject: 'Your order changes status')
  end
end