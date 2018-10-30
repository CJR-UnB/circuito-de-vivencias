# frozen_string_literal: true

class AddWorkshopRefToEvaluation < ActiveRecord::Migration[5.2]
  def change
    add_reference :evaluations, :workshop, foreign_key: true
  end
end
