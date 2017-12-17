class AddTextAndRatingAndTitleToReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :reviews, :text, :text
    add_column :reviews, :rating, :int
    add_column :reviews, :title, :string
  end
end
