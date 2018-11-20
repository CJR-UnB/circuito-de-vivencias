class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @categories = Category.order(:name)
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to adminDashboard_categories_path
    else
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update(category_params)
      redirect_to adminDashboard_categories_path
    else
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      redirect_to adminDashboard_categories_path
    else
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

end
