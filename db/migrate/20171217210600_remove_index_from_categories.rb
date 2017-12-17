class RemoveIndexFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :index, :string
  end
end
