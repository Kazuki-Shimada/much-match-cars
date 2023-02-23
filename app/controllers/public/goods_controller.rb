class Public::GoodsController < ApplicationController
  def create
    review = Review.find(params[:review_id])
    good = current_user.goods.new(review_id: review.id)
    good.save
    redirect_to review_path(review)
  end

  def destroy
    review = Review.find(params[:review_id])
    good = current_user.goods.find_by(review_id: review.id)
    good.destroy
    redirect_to review_params(review)
  end
end
