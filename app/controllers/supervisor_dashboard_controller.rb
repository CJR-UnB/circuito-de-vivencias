class SupervisorDashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_supervisor
    def authenticate_supervisor
        redirect_to(root_path) unless current_user.supervisorRole?
    end

    def home
    end
end
