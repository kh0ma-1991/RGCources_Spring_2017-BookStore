class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :img
      t.float :price

      t.timestamps
    end
  end
end
