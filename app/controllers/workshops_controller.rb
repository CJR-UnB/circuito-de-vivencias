class WorkshopsController < ApplicationController
  before_action :authenticate_user!

  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.author_id = current_user.id
    @workshop.editor_id = current_user.id

    if @workshop.save
      flash[:notice] = 'Workshop criado com sucesso!'
      redirect_to workshops_path
    else
      flash[:alert] = 'Não foi possível criar o workshop!'
      render 'new'
    end
  end

  def new
    @workshop = Workshop.new
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])

    if @workshop.update(workshop_params)
      flash[:notice] = "Workshop atualizado com sucesso!"
      redirect_to workshops_path
    else
      flash[:alert] = "Não foi possível atualizar o workshop!"
      render 'edit'
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])

    if @workshop.destroy
      flash[:notice] = 'Workshop deletado com sucesso!'
    else
      flash[:alert] = 'Não foi possível deletar o workshop!'
    end

    redirect_to workshops_path
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
