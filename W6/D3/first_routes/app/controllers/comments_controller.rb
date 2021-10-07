class CommentsController < ApplicationController
  def index
    comments = Comment
      .where('user_id = ? OR artwork_id = ?', params[:comment][:user_id], params[:comment][:artwork_id])

    render json: comments
  end

  def create
    comment = Comment.new(comments_params)
    if comment.save
      render json: comment
    else 
      render json: comment.errors.full_messages, status: 422
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    render json: comment
  end

  private
  def comments_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end