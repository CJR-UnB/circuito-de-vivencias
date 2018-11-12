class ChangingFeedbackRelations < ActiveRecord::Migration[5.2]
  def change
    rename_column :feedbacks, :workshop_author_id, :workshop_id
  end
end
