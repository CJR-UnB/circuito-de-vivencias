# frozen_string_literal: true

class AddUserRefToEvaluation < ActiveRecord::Migration[5.2]
  def change
    add_reference :evaluations, :user, foreign_key: true
  end
end
