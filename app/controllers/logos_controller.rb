class LogosController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @logos = Logo.order(active: :desc)
  end

  def show
    @logo = Logo.find(params[:id])
  end

  def edit
    @logo = Logo.find(params[:id])
  end

  def update
    logo = Logo.find(params[:id])

    if logo.update(logo_params)
      if logo.active
        only_one_active(logo)
      end
      redirect_to adminDashboard_logos_path
    else
      redirect_to edit_adminDashboard_logo_path(logo.id)
    end
  end

  def new
    @logo = Logo.new()
  end

  def create
    logo = Logo.new(logo_params)

    if logo.save
      if logo.active
        only_one_active(logo)
      end
      redirect_to adminDashboard_logos_path
    else
      redirect_to new_adminDashboard_logo_path
    end
  end

  def destroy
    logo = Logo.find(params[:id])

    if logo.destroy
      redirect_to adminDashboard_logos_path
    else
      redirect_to edit_adminDashboard_logo_path(logo.id)
    end
  end

  private

  def logo_params
    params.require(:logo).permit(:name, :active, :image)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

  def only_one_active(logo)
    Logo.where.not(id: logo.id).where(active: true).each do |l|
      l.unactivate
    end
  end
end
