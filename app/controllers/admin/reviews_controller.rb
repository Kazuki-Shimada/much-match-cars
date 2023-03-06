class Admin::ReviewsController < ApplicationController
  before_action :is_admin, only: [:index, :edit]
  def index
    @reviews = Review.page(params[:page]).per(10)
  end

  def edit
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
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
