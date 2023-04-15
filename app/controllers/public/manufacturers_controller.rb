class Public::ManufacturersController < ApplicationController
  def show
    @models = params[:name].present? ? Tag.find(params[:name]).models : Model.all
    @manufacturer = Manufacturer.find(params[:id])
    @tags = Tag.all
  end
end
