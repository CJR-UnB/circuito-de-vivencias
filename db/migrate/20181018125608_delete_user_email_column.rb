# frozen_string_literal: true

class DeleteUserEmailColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :userEmail
  end
end
