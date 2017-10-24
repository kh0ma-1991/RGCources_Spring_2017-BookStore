class CreateCreditCards < ActiveRecord::Migration[5.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.string :name
      t.integer :cvv
      t.string :expiration_date
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
