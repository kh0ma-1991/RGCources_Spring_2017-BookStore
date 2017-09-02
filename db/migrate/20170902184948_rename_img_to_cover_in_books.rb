class RenameImgToCoverInBooks < ActiveRecord::Migration[5.1]
  def change
    change_table :books do |t|
      t.rename :img, :cover if column_exists?(:books, :img) && !column_exists?(:books, :cover)
    end
  end
end
