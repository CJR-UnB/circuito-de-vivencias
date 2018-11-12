class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def show
  end
  def profile
  end
end
