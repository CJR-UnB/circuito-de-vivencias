class WorkshopsController < ApplicationController

  def index
    @workshops = Workshop.all
  end

  def show
    set_workshop
  end

  def create
  end

  def new
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def workshop_params
      params.require(:workshop).permit(
        :title,
        :categories,
        :resume,
        :author_id,
        :editor_id,
        :document
      )
    end

    def set_workshop
      @workshop = Workshop.find_by(:id)
    end

end
