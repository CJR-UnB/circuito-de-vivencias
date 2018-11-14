class AddingDeafaultRoleToUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role_id, :int, default: 3
  end
end
