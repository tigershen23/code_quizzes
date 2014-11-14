class CommentsController < ApplicationController
  def create
    # parent can be either an article or another comment
    @parent = Article.find(comment_params[:article_id]) if comment_params[:article_id]
    @parent = Comment.find(comment_params[:comment_id]) if comment_params[:comment_id]
    @comment = @parent.comments.new(body: comment_params[:comment][:body])
    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find(comment_params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  def comment_params
    params.permit( { comment: [:body] }, :id, :article_id, :comment_id)
  end
end
