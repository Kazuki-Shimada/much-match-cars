class Admin::ModelsController < ApplicationController
  before_action :is_admin, only: [:index, :edit]
  def index
    @models = params[:name].present? ? Tag.find(params[:name]).models : Model.all
    @model = Model.new
    @tags = Tag.all.order(created_at: :desc)
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end
  def create
    @model = Model.new(model_params)
    if @model.save
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
      params.require(:model).permit(:manufacturer_id, :name, :model_image, :price, tag_ids: [])
    end
    def is_admin
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
