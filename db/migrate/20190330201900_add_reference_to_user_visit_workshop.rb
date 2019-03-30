class AddReferenceToUserVisitWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_visit_workshops, :user
    add_reference :user_visit_workshops, :workshop
  end
end
