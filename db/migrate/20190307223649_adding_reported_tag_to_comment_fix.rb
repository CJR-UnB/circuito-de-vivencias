class AddingReportedTagToCommentFix < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :excluded, :boolean, default: false
  end
end
