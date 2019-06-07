class AddIndexToUsersEmall < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :emall,unique: true
  end
end
