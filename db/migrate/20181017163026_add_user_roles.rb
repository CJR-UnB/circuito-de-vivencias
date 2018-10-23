class AddUserRoles < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :adminRole, :boolean, default: false
    add_column :users, :supervisorRole, :boolean, default: false
    add_column :users, :userRole, :boolean, default: true
  end
end
