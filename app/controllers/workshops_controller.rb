class WorkshopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workshops = Workshop.all
  end

  def show
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.author_id = current_user.id
    @workshop.editor_id = current_user.id

    if @workshop.save!
      flash['Sucesso!']
      redirect_to workshops_path
    else
      flash['Falha!']
      redirect_to new_workshop_path
    end
  end

  def new
    @workshop = Workshop.new
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
      )
    end

end
