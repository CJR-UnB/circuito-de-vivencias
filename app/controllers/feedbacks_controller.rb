class FeedbacksController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_supervisor, only: [:new, :create]
    def authenticate_supervisor
        redirect_to(root_path) unless current_user.supervisorRole?
    end

    def new
        @feedback = Feedback.new

        @workshop_id = params[:id]
    end

    def create
        @feedback = Feedback.new(feedback_params)
        @feedback.supervisor = current_user
        workshop = Workshop.find(params[:workshop_id])
        workshop.reject
        workshop.save
        @feedback.workshop = workshop
        if @feedback.save!
            redirect_to supervisorDashboard_unvalidated_workshops_path
        else
            redirect_to supervisorDashboard_write_feedback_path(id: params[:workshop_id])
        end
    end

    def show
        @feedback = Feedback.find_by(workshop_id: params[:workshop_id])
        @workshop = Workshop.find(params[:workshop_id])
        @supervisor_author = User.find(@feedback.supervisor.id)
    end

    private
        def feedback_params
            params.require(:feedback).permit(
                :subject,
                :content
              )
        end
end
