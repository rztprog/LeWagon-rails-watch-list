class DeleteUserFromLists < ActiveRecord::Migration[6.1]
  def change
    remove_column :lists, :user, :integer
  end
end
