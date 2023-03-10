class Public::CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @review = Review.find(params[:review_id])
    @comment.review_id = @review.id
    @comment.save
    redirect_to review_path(@comment.review)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :body)
  end

end
