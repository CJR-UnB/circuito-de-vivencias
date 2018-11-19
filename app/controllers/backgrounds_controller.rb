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
      redirect_to backgrounds_path
    else
      redirect_to backgrounds_path
    end
  end

  def new
    @background = Background.new()
  end

  def create
    background = Background.new(background_params)

    if background.save
      redirect_to backgrounds_path
    else
      redirect_to new_background_path
    end
  end

  private

  def background_params
    params.require(:background).permit(:active, :image)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

end
