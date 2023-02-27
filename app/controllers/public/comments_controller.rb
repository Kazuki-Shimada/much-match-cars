class Public::CommentsController < ApplicationController
  def create
    comment = Comment.new
    comment.user_id = current_user.id
    comment.save!
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :review_id, :body)
  end
end
