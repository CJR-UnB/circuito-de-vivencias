# frozen_string_literal: true

class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.integer :evaluationContent

      t.timestamps
    end
  end
end
