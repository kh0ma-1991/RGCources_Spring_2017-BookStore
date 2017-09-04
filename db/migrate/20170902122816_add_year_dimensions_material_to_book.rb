class AddYearDimensionsMaterialToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :year, :integer
    add_column :books, :dimensions, :json, default: {H:0, W: 0, D: 0}
    add_column :books, :materials, :text
  end
end
