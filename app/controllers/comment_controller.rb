# frozen_string_literal: true

class CommentController < ApplicationController
  before_action :set_post, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comentário criado com sucesso!'
      redirect_to workshop_path(@comment.workshop_id)
    else
      flash.now[:error] = 'Erro na insersão do comentário'
      redirect_to workshop_path(@comment.workshop_id)
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:commentContent, :workshop_id)
  end
end
