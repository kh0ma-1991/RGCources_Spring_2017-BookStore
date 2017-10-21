class RenameFisrtNameToFirstNameInAddresses < ActiveRecord::Migration[5.1]
  def change
    rename_column :addresses, :fisrt_name, :first_name
  end
end
