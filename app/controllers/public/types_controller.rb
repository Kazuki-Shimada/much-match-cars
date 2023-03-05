class Public::TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @total = 0
  end
end
