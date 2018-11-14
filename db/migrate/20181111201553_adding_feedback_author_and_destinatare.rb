class AddingFeedbackAuthorAndDestinatare < ActiveRecord::Migration[5.2]
  def change
    add_column :feedbacks, :supervisor_id, :boolean
    add_column :feedbacks, :user_id, :boolean
  end
end
