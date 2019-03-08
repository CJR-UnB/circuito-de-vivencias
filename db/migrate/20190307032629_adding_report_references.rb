class AddingReportReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :reports, :users
    add_reference :reports, :comments
  end
end
