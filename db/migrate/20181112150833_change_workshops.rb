class ChangeWorkshops < ActiveRecord::Migration[5.2]
  def change
    remove_column :workshops, :categories, :string
  end
end
