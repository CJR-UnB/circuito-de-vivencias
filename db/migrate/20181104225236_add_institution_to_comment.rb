class AddInstitutionToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :institution, :string
  end
end
