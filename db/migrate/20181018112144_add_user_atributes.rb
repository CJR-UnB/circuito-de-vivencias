class AddUserAtributes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :userEmail, :string
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :cpf, :string
  end
end
