class CreateCoupons < ActiveRecord::Migration[5.1]
  def change
    create_table :coupons do |t|
      t.references :order, foreign_key: true
      t.boolean :used, default: false, null: false
      t.string :secret_code, null: false
      t.decimal :discount, precision: 3, scale: 2, null: false, default: 0

      t.timestamps
    end
  end
end
