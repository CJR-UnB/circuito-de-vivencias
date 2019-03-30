class AddingNewColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :public_scholl?, :bool
    add_column :users, :estate, :integer
  end
end
