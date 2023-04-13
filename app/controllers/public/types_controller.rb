class Public::TypesController < ApplicationController
  def show
    @type = Type.find(params[:id])
    @total = 0
    @reviews = Review.where(type_id: @type.id)
  end
  def selected
    if params[:manufacturer_id]
      @models = Model.where(manufacturer_id: params[:manufacturer_id])
      if params[:page_type] == 'car'
        render :car_model
      else
        render :model
      end
    end
    if params[:model_id]
      @types = Type.where(model_id: params[:model_id])
      if params[:page_type] == 'car'
        render :car_type
      else
        render :type
      end
    end
  end
end
