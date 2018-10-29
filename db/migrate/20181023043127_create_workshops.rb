# frozen_string_literal: true

class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :title
      t.string :categories
      t.string :resume

      t.timestamps
    end
  end
end
