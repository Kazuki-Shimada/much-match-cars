class Admin::ReviewsController < ApplicationController
  before_action :is_admin, only: [:index, :edit, :destroy]
  def index
    @reviews = Review.order("created_at DESC").page(params[:page]).per(5)
  end
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      flash[:deleted] = "投稿を削除しました"
      redirect_to admin_reviews_path
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
