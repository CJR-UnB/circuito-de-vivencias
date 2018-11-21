class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :user_workshops]

  def show; end

  def profile; end

  def user_workshops
    @page = params[:page]
    @last_page = Workshop.where({ author_id: current_user.id} ).page(1).per(8).total_pages
    @workshops = Workshop.where({ author_id: current_user.id} ).order(:updated_at).page(@page).per(8)
  end

  def videos_index
    @page = params[:page]
    @last_page = Video.all.page(1).per(20).total_pages
    @videos = Video.all.order(:created_at).page(@page).per(20)
  end
end
