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
      @last_page = Workshop.where(status: 'accepted').where('title LIKE ?', "%#{@title}%").page(1).per(16).total_pages
      @workshops = Workshop.where(status: 'accepted').where('title LIKE ?', "%#{@title}%").order(:updated_at).page(@page).per(16)
    else
      @last_page = Workshop.where(status: 'accepted' ).page(1).per(16).total_pages
      @workshops = Workshop.where(status: 'accepted' ).order(:updated_at).page(@page).per(16)
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
    @comment = Comment.new
    @comments = Comment.where(workshop_id: params[:id])
  end

  def create
    workshop = Workshop.new(workshop_params)
    workshop.author_id = current_user.id
    workshop.editor_id = current_user.id

    if workshop.save
      flash[:notice] = 'Workshop criado com sucesso!'
      redirect_to user_workshops_path
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
    workshop = Workshop.find(params[:id])
    workshop.put_in_hold
    if workshop.update(workshop_params)
      flash[:notice] = 'Workshop atualizado com sucesso!'
      redirect_to user_workshops_path
    else
      flash[:alert] = 'Não foi possível atualizar o workshop!'
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
        :resume,
        :document
      )
    end

    def search_workshop_params
      params.require(:workshop).permit(:title)
    end
end
