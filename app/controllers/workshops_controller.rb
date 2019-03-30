# frozen_string_literal: true

class WorkshopsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_workshop, only: [:show]


  def verify_workshop
    @workshop = Workshop.find(params[:id])
    if @workshop.status != 'accepted'
      if Role.find(current_user.role_id).name != 'Supervisor' && current_user.id != @workshop.author_id
        puts current_user.id
        puts @workshop.author_id
        redirect_to root_path
      end
    end
  end

  def index
    @title = params[:title]
    @page = params[:page]
    puts @title
    if @title
      @last_page = Workshop.where(status: 'accepted').where('unaccent(lower(title)) ILIKE unaccent(lower(?))', "%#{params[:title]}%").page(1).per(16).total_pages
      @workshops = Workshop.where(status: 'accepted').where('unaccent(lower(title)) ILIKE unaccent(lower(?))', "%#{params[:title]}%").order(:updated_at).page(@page).per(16)
    else
      @last_page = Workshop.where(status: 'accepted' ).page(1).per(16).total_pages
      @workshops = Workshop.where(status: 'accepted' ).order(:updated_at).page(@page).per(16)
    end
  end

  def create_visit
    if (current_user != nil)
      UserVisitWorkshop.find_or_create_by(user_id: current_user.id, workshop_id: params[:id])
    end
    redirect_to workshop_path(id: params[:id])
  end

  def show
    @workshop = Workshop.find(params[:id])
    @vizualization = UserVisitWorkshop.where(workshop_id: @workshop_id).length
    @user_evaluation = Evaluation.find_by(user_id: current_user.id, workshop_id: @workshop.id)
    @comment = Comment.new
    @comments = Comment.where(workshop_id: params[:id], excluded: false).order(created_at: :desc)
  end

  def create
    workshop = Workshop.new(workshop_params)
    workshop.author_id = current_user.id
    workshop.editor_id = current_user.id

    if workshop.save
      flash[:notice] = 'Vivência criada com sucesso!'
      WorkshopMailer.workshop_info(workshop).deliver
      redirect_to user_workshops_path
    else
      flash[:alert] = 'Não foi possível criar a vivência!'
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
    workshop = Workshop.find(params[:id])
    workshop.put_in_hold
    if workshop.update(workshop_params)
      flash[:notice] = 'Vivência atualizada com sucesso!'
      redirect_to user_workshops_path
    else
      flash[:alert] = 'Não foi possível atualizar a vivência!'
      render 'edit'
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])

    if @workshop.destroy
      flash[:notice] = 'Vivência deletada com sucesso!'
    else
      flash[:alert] = 'Não foi possível deletar a vivência!'
    end

    redirect_to workshops_path
  end

  private
    def workshop_params
      params.require(:workshop).permit(
        :title,
        :resume,
        :document
      )
    end

    def search_workshop_params
      params.require(:workshop).permit(:title)
    end
end
