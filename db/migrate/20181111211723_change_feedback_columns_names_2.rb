class ChangeFeedbackColumnsNames2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :feedbacks, :supervisor, :supervisor_id
    rename_column :feedbacks, :workshop_author, :workshop_author_id
  end
end
