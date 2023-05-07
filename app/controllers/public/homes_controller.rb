class Public::HomesController < ApplicationController
  def top
    @reviews = Review.order("created_at DESC").page(params[:page]).per(10)
  end

  def about
  end
end