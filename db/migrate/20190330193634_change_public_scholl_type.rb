class ChangePublicSchollType < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :public_scholl?
    add_column :users, :institution_type, :integer
  end
end
