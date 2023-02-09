class Admin::ManufacturersController < ApplicationController
  def index
    @manufacturer = Manufacturer.new
    @manufacturers = Manufacturer.all
  end

  def edit
  end

  def create
    manufacturer = Manufacturer.new(manufacturer_params)
    if manufacturer.save
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
end
