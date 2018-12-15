class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @workshops = Workshop.where(status: 1).order('display DESC, title')
  end

  def update
    workshop = Workshop.find(params[:id])

    if params[:display]
      workshop.show
      only_three_actives(workshop)
    else
      worshop.hide
    end

    redirect_to adminDashboard_workshops_path
  end

  private

  def workshop_params
    params.require(:workshop).permit(:active)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

  def only_three_actives(workshop)
    if Workshop.where(display: true).size > 3
      Workshop.where.not(id: workshop.id).find_by(display: true).hide
    end
  end
end
