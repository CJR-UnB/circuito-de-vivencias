class CreateStaffMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_members do |t|
      t.string :name
      t.string :role

      t.timestamps
    end
  end
end
