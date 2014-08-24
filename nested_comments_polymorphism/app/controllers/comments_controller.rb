class CommentsController < ApplicationController

  def new
    @parent_comment = Comment.find(params[:comment_id])
    @comment = @parent_comment.comments.new
  end

  def create
    @parent = Article.find(params[:article_id]) if params[:article_id]
    @parent = Comment.find(params[:comment_id]) if params[:comment_id]
    @comment = @parent.comments.new(comment_params)
    if @comment.save
      redirect_to(:back)
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.comments.destroy_all
    @comment.destroy
    redirect_to articles_path
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
