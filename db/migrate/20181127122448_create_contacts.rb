class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.string :email
      t.boolean :active

      t.timestamps
    end
  end
end
