class Admin::TypesController < ApplicationController
  def new
    @type = Type.new
  end

  def edit
  end

  def index
  end
  
  def create
    type = Type.new(type_params)
    if type.save
      redirect_to admin_types_path
    else
      render :new
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
    params.require(:type).permit(:model_id, :name, :capacity, :displacement, :is_selling)
  end
  
end
