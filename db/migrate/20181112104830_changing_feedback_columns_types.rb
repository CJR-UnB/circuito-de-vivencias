class ChangingFeedbackColumnsTypes < ActiveRecord::Migration[5.2]
  def change
    remove_column :feedbacks, :supervisor_id
    remove_column :feedbacks, :workshop_id
  end
end
