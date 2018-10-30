# frozen_string_literal: true

class EvaluationsController < ApplicationController
  before_action :authenticate_user!
  def create
    @workshop = Workshop.find(evaluation_params[:workshop_id])

    @evaluation = Evaluation.new(workshop: @workshop, user: current_user, evaluationContent: evaluation_params)
  end

  private

  def evaluation_params
    params.require(:evaluation).permit(
      :user_id,
      :workshop_id,
      :evaluationContent
    )
  end
end
