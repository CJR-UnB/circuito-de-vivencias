class CreateUserDownloadWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :user_download_workshops do |t|

      t.timestamps
    end
  end
end
