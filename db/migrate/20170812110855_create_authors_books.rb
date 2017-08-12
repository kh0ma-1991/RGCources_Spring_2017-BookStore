class CreateAuthorsBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :authors_books, id: false do |t|
      t.references :author, index: true
      t.references :book, index: true
    end
    add_index :authors_books, [:author_id, :book_id]
  end
end
