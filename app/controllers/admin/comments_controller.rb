class Admin::CommentsController < ApplicationController
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to admin_review_path(@comment.review)
    else
      render :index
    end
  end
end
