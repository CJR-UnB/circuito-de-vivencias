# frozen_string_literal: true

class EvaluationsController < ApplicationController

  before_action :authenticate_user!
  protect_from_forgery with: :null_session

  def give_an_evaluation
    @evaluation = Evaluation.find_or_create_by(workshop_id: params[:workshop_id], user_id: params[:user_id])
    @evaluation.evaluationContent = params[:evaluationContent]
    @evaluation.save
  end

end