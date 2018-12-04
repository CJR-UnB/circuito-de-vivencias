class StaffMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @staff_members = StaffMember.order(:name)
  end

  def new
    @staff_member = StaffMember.new()
  end

  def create
    staff_member = StaffMember.new(staff_params)

    if staff_member.save
      redirect_to adminDashboard_staff_members_path
    else
      redirect_to new_adminDashboard_staff_member_path
    end
  end

  def edit
    @staff_member = StaffMember.find(params[:id])
  end

  def update
    staff_member = StaffMember.find(params[:id])

    if staff_member.update(staff_params)
      redirect_to adminDashboard_staff_members_path
    else
      redirect_to adminDashboard_staff_members_path
    end
  end

  def destroy
    staff_member = StaffMember.find(params[:id])

    if staff_member.destroy
      redirect_to adminDashboard_staff_members_path
    else
      redirect_to adminDashboard_staff_members_path
    end
  end

  private

  def staff_params
    params.require(:staff_member).permit(:name, :role, :image)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end
end
