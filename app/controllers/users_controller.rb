class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :rejected_workshops]

  def show; end

  def profile; end

  def rejected_workshops
    @workshops = Workshop.where({ author_id: current_user.id, status: "rejected" } )
  end
end
