class ChangingFeedbackColumnsTypes2 < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :supervisor_id, :integer
    add_column :feedbacks, :workshop_id, :integer
    add_foreign_key :feedbacks, :users, column: :supervisor_id
    add_foreign_key :feedbacks, :workshops, column: :workshop_id, on_delete: :cascade
  end
end
