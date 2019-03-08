class ReportsController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin, only: [:index, :exclude_comment]
    layout 'adminDashboard/adminDashboard', only: [:index]
    def create
        @report = Report.find_or_create_by(users_id: params[:user_id], comments_id: params[:comment_id])
        flash[:notice] = 'Comentário reportado!'
        redirect_to workshop_path(id: params[:workshop_id])
    end

    def index
        @reports = Report.where(resolved: false)
        @reported_comments = []
        @reports.each do |report|
            comment = Comment.find(report.comments_id)
            class << comment
                attr_accessor :users
            end
            comment.users = []
            @reports.each do |report2|
                if report2.comments_id == comment.id
                    comment.users << User.find(report.users_id)
                end
            end
            @reported_comments << comment
        end
        @reported_comments = @reported_comments.uniq
    end

    def exclude_comment
        comment = Comment.find(params[:id])
        reports = Report.where(comments_id: comment.id)
        reports.each do |report|
            report.resolved = true
            report.save
        end 
        comment.excluded = true
        comment.save
        flash[:notice] = 'Comentário excluido!'
        redirect_to reports_path
    end

    def accept_comment
        comment = Comment.find(params[:id])
        reports = Report.where(comments_id: comment.id)
        reports.each do |report|
            report.resolved = true
            report.save
        end
        flash[:notice] = 'Comentário aceito'
        redirect_to reports_path
    end

    private

        def authenticate_admin
            redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
        end

end
