class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :user_workshops, :update_user, :delete_user]

  def show; end

  def profile; end

  def edit_user
    @user = User.find(current_user.id)
  end

  def update_user
    user = User.find(current_user.id)

    if user.update(user_params)
      flash[:notice] = "Usuário atualizado com sucesso!"
      redirect_to profile_path
    else
      flash[:notice] = "Não foi possível atualizar o usuário!"
      redirect_to edit_user_path
    end
  end

  def delete_user
    user = User.find(current_user.id)
    session.delete(current_user.id)
    if user.destroy
      flash[:notice] = "Usuário deletado com sucesso!"
      redirect_to root_path
    else
      flash[:alert] = "Não foi possível deletar o usuário!"
      redirect_to profile_path
    end
  end

  def user_workshops
    @page = params[:page]
    @last_page = Workshop.where({ author_id: current_user.id} ).page(1).per(8).total_pages
    @workshops = Workshop.where({ author_id: current_user.id} ).order(:updated_at).page(@page).per(8)
  end

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

  private
    def user_params
      params.require(:user).permit(
        :name,
        :surname,
        :cpf,
        :email
      )
    end

    def search_videos_params
      params.require(:video).permit(:title)
    end
end
