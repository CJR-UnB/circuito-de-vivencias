class FeedbacksController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_supervisor, only: [:new]
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
        workshop_author = User.find(workshop.author_id)
        @feedback.workshop_author = workshop_author
        if @feedback.save!
            redirect_to supervisorDashboard_unvalidated_workshops_path
        else
            redirect_to supervisorDashboard_write_feedback_path(id: params[:workshop_id])
        end
    end
    private
        def feedback_params
            params.require(:feedback).permit(
                :subject,
                :content
              )
        end
end
