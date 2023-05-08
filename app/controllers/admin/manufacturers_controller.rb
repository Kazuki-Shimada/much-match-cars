class Admin::ManufacturersController < ApplicationController
  before_action :is_admin, only: [:index, :edit]
  def index
    @manufacturer = Manufacturer.new
    @manufacturers = Manufacturer.all.order(created_at: :desc)
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to admin_manufacturers_path
    else
      render :index
    end
  end
  def destroy
    manufacturer = Manufacturer.find(params[:id])
    if manufacturer.destroy
      redirect_to admin_manufacturers_path
    else
      render :index
    end
  end

  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name)
    end
    def is_admin
      unless admin_signed_in?
        redirect_to root_path
      end
    end
end
