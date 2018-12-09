# frozen_string_literal: true

class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def home; end

  def videos_index
    @page = params[:page]
    @title = params[:title]
    if @title
      @last_page = Video.where('title LIKE ?', "%#{params[:title]}%").page(1).per(20).total_pages
      @videos = Video.where('title LIKE ?', "%#{params[:title]}%").order(:created_at).page(@page).per(20)
    else
      @last_page = Video.all.page(1).per(20).total_pages
      @videos = Video.all.order(:created_at).page(@page).per(20)
    end
  end

  def new_video
    @video = Video.new
  end

  def create_video
    video = Video.new(video_params)
    if video.save
      six_actives(video)
      flash[:notice] = "Video criado com sucesso"
      redirect_to adminDashboard_videos_path(page: 1)
    else
      if video.title == nil
        flash[:alert] = "Titulo não pode estar em branco"
      else
        flash[:alert] = "Url invalida"
      end
      redirect_to adminDashboard_post_video_path
    end
  end

  def delete_video
    @video = Video.find(params[:id])
    @video.delete
    redirect_to adminDashboard_videos_path(page: params[:page])
  end

  def edit_video
    @video = Video.find(params[:id])
  end

  def update_video
    video = Video.find(params[:id])

    if video.update(video_params)
      six_actives(video)
      redirect_to adminDashboard_videos_path(page: params[:page])
    else
      redirect_to adminDashboard_videos_path(page: params[:page])
    end
  end

  def users
    @users = User.order(:name)
  end

  def edit_user
    @user = User.find(params[:id])
  end

  def update_user
    user = User.find(params[:id])

    if user.update(user_params)
      flash[:notice] = "Usuário atualizado com sucesso!"
      redirect_to adminDashboard_users_path
    else
      flash[:notice] = "Não foi possível atualizar o usuário!"
      redirect_to adminDashboard_users_path
    end
  end

  def delete_user
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = "Usuário deletado com sucesso!"
      redirect_to adminDashboard_users_path
    else
      flash[:alert] = "Não foi possível deletar o usuário!"
      redirect_to adminDashboard_users_path
    end
  end

  private

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

  def user_params
    params.require(:user).permit(
      :name,
      :surname,
      :cpf,
      :role_id
    )
  end

  def video_params
    params.require(:video).permit(
      :url,
      :title,
      :active
    )
  end

  def six_actives(video)
    if Video.where(active: true).size > 6
      Video.where.not(id: video.id).find_by(active: true).unactivate
    end
  end
end
