# frozen_string_literal: true

module EvaluationsHelper
  def evaluation_avg(workshop)
    workshop.evaluations.average(:evaluationContent)
  end
end
