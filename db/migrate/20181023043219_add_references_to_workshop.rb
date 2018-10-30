# frozen_string_literal: true

class AddReferencesToWorkshop < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :author_id, :integer
    add_column :workshops, :editor_id, :integer
  end
end
