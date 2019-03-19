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
    puts 'eai'
    if @comment.save
      flash[:notice] = 'Comentário criado com sucesso!'
      redirect_to workshop_path(id: @comment.workshop_id, :anchor => "#create_new_comment")
    else
      flash.now[:error] = 'Erro na insersão do comentário'
      redirect_to workshop_path(id: @comment.workshop_id, :anchor => "#create_new_comment")
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
    params.require(:comment).permit(:name, :institution, :commentContent, :workshop_id, :user_id)
  end
end
