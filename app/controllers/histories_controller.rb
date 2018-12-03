class HistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @histories = History.order(order: :asc)
  end

  def new
    @history = History.new()

    if History.order(order: :desc).present?
      @min = History.order(order: :desc).first.order + 1
    else
      @min = 1
    end
  end

  def create
    history = History.new(history_params)

    if history.save
      redirect_to adminDashboard_histories_path
    else
      redirect_to new_adminDashboard_history_path
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def update
    history = History.find(params[:id])

    if history.update(history_params)
      redirect_to adminDashboard_histories_path
    else
      redirect_to new_adminDashboard_history_path
    end
  end

  def destroy
    contact = History.find(params[:id])
    if contact.destroy
      redirect_to adminDashboard_histories_path
    else
      redirect_to adminDashboard_histories_path
    end
  end

  private

  def history_params
    params.require(:history).permit(:time, :title, :body, :order, :image)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end
end
