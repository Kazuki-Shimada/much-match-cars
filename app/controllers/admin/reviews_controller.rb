class Admin::ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def edit
  end
  def destroy
    review = Review.find(params[:id])
    if review.destroy
      redirect_to admin_reviews_path
    else
      render :index
    end
  end
end
