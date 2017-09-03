class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :url
      t.references :book, index: true

      t.timestamps
    end
  end
end
