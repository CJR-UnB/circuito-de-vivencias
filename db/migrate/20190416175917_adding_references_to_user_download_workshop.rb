class AddingReferencesToUserDownloadWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_download_workshops, :user
    add_reference :user_download_workshops, :workshop
  end
end
