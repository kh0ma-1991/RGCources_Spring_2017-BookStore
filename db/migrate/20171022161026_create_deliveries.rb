class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.string :method
      t.string :days
      t.decimal :price, precision: 5, scale: 2

      t.timestamps
    end
  end
end
