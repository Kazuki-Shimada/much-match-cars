class Public::CommentsController < ApplicationController
  before_action :comment_user, only: [:destroy]
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @review = Review.find(params[:review_id])
    @comment.review_id = @review.id
    if @comment.save
      redirect_to review_path(@comment.review)
    else
      render 'public/reviews/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @comment = @review.comments.find(params[:review_id])
    if @comment.destroy
      flash[:deleted] = "コメントを削除しました"
      redirect_to review_path(@comment.review)
    else
      render :index
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :review_id, :body)
    end
    def comment_user
      unless Comment.find(params[:review_id]).user == current_user
        redirect_to root_path
      end
    end
end
