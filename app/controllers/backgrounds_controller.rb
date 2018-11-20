class BackgroundsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @backgrounds = Background.order(active: :desc)
  end

  def show
    @background = Background.find(params[:id])
  end

  def edit
    @background = Background.find(params[:id])
  end

  def update
    background = Background.find(params[:id])

    if background.update(background_params)
      if background.active
        only_one_active(background)
      end
      redirect_to adminDashboard_backgrounds_path
    else
      redirect_to adminDashboard_backgrounds_path
    end
  end

  def new
    @background = Background.new()
  end

  def create
    background = Background.new(background_params)

    if background.save
      if background.active
        only_one_active(background)
      end
      redirect_to adminDashboard_backgrounds_path
    else
      redirect_to new_adminDashboard_background_path
    end
  end

  private

  def background_params
    params.require(:background).permit(:active, :image)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

  def only_one_active(background)
    Background.where.not(id: background.id).where(active: true).each do |b|
      b.unactivate
    end
  end

end
