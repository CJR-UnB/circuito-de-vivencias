class AddStatusToWorkshops < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :status, :integer
  end
end
