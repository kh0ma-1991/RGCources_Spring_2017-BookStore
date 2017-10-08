class SetDefaultValueQuantityForOrderItems < ActiveRecord::Migration[5.1]
  def change
    change_column :order_items, :quantity, :integer, :default => 0, :null => false
  end
end
