class AddOrderToHistory < ActiveRecord::Migration[5.2]
  def change
    add_column :histories, :order, :integer
  end
end
