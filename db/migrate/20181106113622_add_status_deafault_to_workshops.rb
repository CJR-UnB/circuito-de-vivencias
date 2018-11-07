class AddStatusDeafaultToWorkshops < ActiveRecord::Migration[5.2]
  def change
    change_column :workshops, :status, :integer, default: 0
  end
end
