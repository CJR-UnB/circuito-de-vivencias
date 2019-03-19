class AddingReportedTagToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :excluded, :boolean
  end
end
