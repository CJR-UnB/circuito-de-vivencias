# frozen_string_literal: true

class AdminDashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def home
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

  def users
    @users = User.order(:name)
  end

  private

  def authenticate_admin
    redirect_to(root_path) unless current_user.adminRole?
  end

  def user_params
    params.require(:user).permit(
      :name,
      :surname,
      :cpf,
      :adminRole,
      :supervisorRole,
      :userRole
    )
  end

end
