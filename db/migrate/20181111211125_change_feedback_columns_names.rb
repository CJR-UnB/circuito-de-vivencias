class ChangeFeedbackColumnsNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :feedbacks, :supervisor_id, :supervisor
    rename_column :feedbacks, :user_id, :workshop_author
  end
end
