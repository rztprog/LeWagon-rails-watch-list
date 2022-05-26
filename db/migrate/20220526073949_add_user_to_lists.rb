class AddUserToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :user, :integer
  end
end
