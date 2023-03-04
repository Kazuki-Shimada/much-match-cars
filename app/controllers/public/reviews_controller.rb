class Public::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end
  def create
    review = Review.new(review_params)
    review.user_id = current_user.id
    if review.save
      redirect_to root_path
    else
      render :new
    end
  end
  private
  def review_params
    params.require(:review).permit(:user_id, :type_id, :rate, :title, :body, :design, :driving_performance, :cost, :size, :safety, :rate)
  end
end
