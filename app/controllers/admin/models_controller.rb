class Admin::ModelsController < ApplicationController
  def index
    @models = Model.all
    @model = Model.new
  end

  def edit
  end
  def create
    model = Model.new(model_params)
    if model.save
      redirect_to admin_models_path
    else
      render :index
    end
  end
  def destroy
    model = Model.find(params[:id])
    if model.destroy
      redirect_to admin_models_path
    else
      render :index
    end
  end
  
  private
  def model_params
    params.require(:model).permit(:manufacturer_id, :name, :model_image)
  end
end