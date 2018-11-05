class AddReportsToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :reports, :integer, default: 0
  end
end
