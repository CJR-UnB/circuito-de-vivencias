class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  layout 'adminDashboard/adminDashboard'

  def index
    @contacts = Contact.order(active: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)

    if contact.save
      if contact.active
        only_one_active(contact)
      end
      redirect_to adminDashboard_contacts_path
    else
      redirect_to new_adminDashboard_contact_path
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update(contact_params)
      if contact.active
        only_one_active(contact)
      end
      redirect_to adminDashboard_contacts_path
    else
      redirect_to edit_adminDashboard_contact_path(contact.id)
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy
      redirect_to adminDashboard_contacts_path
    else
      redirect_to adminDashboard_contacts_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:active, :phone, :email)
  end

  def authenticate_admin
    redirect_to(root_path) unless Role.find(current_user.role_id).name == 'Admin'
  end

  def only_one_active(contact)
    Contact.where.not(id: contact.id).where(active: true).each do |c|
      c.unactivate
    end
  end
end
