class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.commentable_id = commentable_id(@comment)
    if @comment.save
      redirect_to comment_url(@comment)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to comment_url(@comment)
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_type)
  end

  def comment_url(comment)
    send("#{comment.commentable_type.downcase}_url", comment.commentable_id)
  end

  def commentable_id(comment)
    params["#{comment.commentable_type.downcase}_id"]
  end
end