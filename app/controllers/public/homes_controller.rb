class Public::HomesController < ApplicationController
  def top
    @reviews = Review.order("created_at DESC").page(params[:page]).per(5)qcwe
  end

  def about
  end
end
