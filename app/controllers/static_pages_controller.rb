# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @logedUser = current_user
  end
end
