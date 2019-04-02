class AddingInstitutionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :institution, :string
  end
end
