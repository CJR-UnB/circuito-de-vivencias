# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @videos = Video.where(active: true)
    @contact = Contact.find_by(active: true)
    @histories = History.order(order: :asc)
    @staff_members = StaffMember.order(:name)
    @logo = Logo.find_by(active: :true)
    @workshops = Workshop.where(display: true, status: 1)
  end
end
