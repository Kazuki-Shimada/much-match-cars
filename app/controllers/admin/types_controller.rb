class Admin::TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def edit
    @type = Type.find(params[:id])
  end

  def index
    @types = Type.all
  end

  def create
    type = Type.new(type_params)
    if type.save
      redirect_to admin_types_path
    else
      render :new
    end
  end
  def update
    type = Type.find(params[:id])
    if type.update(type_params)
      redirect_to admin_types_path
    else
      render :edit
    end
  end
  def selected
    if params[:manufacturer_id]
      @models = Model.where(manufacturer_id: params[:manufacturer_id])
      render :model
    end

  end
  private
  def type_params
    params.require(:type).permit(:model_id, :name, :price, :fuel, :fuel_consumption, :capacity, :displacement, :is_selling, :type_image)
  end

end
