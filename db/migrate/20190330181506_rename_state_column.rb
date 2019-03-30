class RenameStateColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :estate, :state
  end
end
