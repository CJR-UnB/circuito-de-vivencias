class CreateUserVisitWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :user_visit_workshops do |t|

      t.timestamps
    end
  end
end
