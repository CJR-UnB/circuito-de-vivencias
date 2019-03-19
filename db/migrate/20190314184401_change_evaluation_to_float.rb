class ChangeEvaluationToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :evaluations, :evaluationContent, :float
  end
end
