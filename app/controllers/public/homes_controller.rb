class Public::HomesController < ApplicationController
  def top
    @reviews = Review.page(params[:page]).per(10)
  end

  def about
  end
end