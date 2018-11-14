class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :adminRole, :boolean, default: false
    remove_column :users, :supervisorRole, :boolean, default: false
    remove_column :users, :userRole, :boolean, default: true
    add_reference :users, :role
  end
end
