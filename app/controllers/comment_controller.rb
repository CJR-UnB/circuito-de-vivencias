class CommentController < ApplicationController

  before_action :set_post, only: [:destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = Comment.new
  end


  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to root_path
      else
        flash.now[:error] = "Erro na insersão do comentário"
        redirect_to root_path
      end
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
        params.require(:comment).permit(:commentContent)
    end

end
