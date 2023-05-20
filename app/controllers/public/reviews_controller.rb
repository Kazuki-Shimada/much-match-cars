class Public::ReviewsController < ApplicationController
  before_action :is_signed_in, only: [:show, :new]
  before_action :review_user, only: [:destroy]
  def new
    @review = Review.new
  end
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to root_path
    else
      render :new
    end
  end
  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def review_params
      params.require(:review).permit(:user_id, :type_id, :rate, :title, :body, :design, :driving_performance, :cost, :size, :safety, :rate, :review_image)
    end
    def is_signed_in
      unless user_signed_in?
        redirect_to guests_guidance_path
      end
    end
    def review_user
      params[:review][:user_id]
      if review.user_id == current_user.id
        redirect_to root_path
      end
    end
end
