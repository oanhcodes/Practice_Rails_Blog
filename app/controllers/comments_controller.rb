class CommentsController < ApplicationController
  before_filter :authorize
  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.commenter_id = @current_user.id
    @comment.save
    redirect_to article_path(@comment.article)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
