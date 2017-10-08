class AddSubtotalToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :subtotal, :decimal, precision: 12, scale: 3
  end
end
