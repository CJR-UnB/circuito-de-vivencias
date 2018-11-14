class SupervisorDashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_supervisor
    def authenticate_supervisor
        redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Supervisor'
    end

    def home
        @users = User.count
        @workshops = Workshop.count
        @supervisors = User.where(role_id: Role.find_by(name: 'Supervisor').id).length
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

end
