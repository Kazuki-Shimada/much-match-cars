class Admin::CommentsController < ApplicationController
  before_action :is_admin, only: [:destroy]
  def destroy
    @review = Review.find(params[:id])
    comment = @review.comments.find(params[:review_id])
    if comment.destroy
      flash[:deleted] = "コメントを削除しました"
      redirect_to admin_review_path(comment.review)
    else
      render :index
    end
  end

  private
    def is_admin
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
