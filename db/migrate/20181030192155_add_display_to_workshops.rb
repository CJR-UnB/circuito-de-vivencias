class AddDisplayToWorkshops < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :display, :boolean, default: false
  end
end
