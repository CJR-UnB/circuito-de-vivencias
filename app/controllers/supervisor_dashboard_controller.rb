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
end
