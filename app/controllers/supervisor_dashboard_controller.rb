class SupervisorDashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_supervisor
    def authenticate_supervisor
        redirect_to(root_path) unless current_user.supervisorRole?
    end

    def home
        @users = User.count
        @workshops = Workshop.count
        @supervisors = User.where(supervisorRole: true).length
        @comments = Comment.count
    end

    def show_unvalidated_workshops
        @workshops = Workshop.all
    end

    def accept_workshop
        @workshop = Workshop.find(params[:id])
        @workshop.accept
        @workshop.save
        redirect_to supervisorDashboard_unvalidated_workshops_path
    end

    def reject_workshop
        @workshop = Workshop.find(params[:id])
        @workshop.reject
        @workshop.save
        redirect_to supervisorDashboard_unvalidated_workshops_path
    end

end
