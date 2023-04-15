class Public::CarsController < ApplicationController

  def edit
    @car = Car.find(params[:id])
  end
  def new
    @car = Car.new
  end

  def create
    car = Car.new(car_params)
    car.user_id = current_user.id
    car.type_id = params[:review][:type_id]
    if car.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  def destroy
    car = Car.find(params[:id])
    if car.destroy
      redirect_to user_path(current_user)
    else
      render :new
    end
  end
  def update
    car = Car.find(params[:id])
    if car.update(car_params)
      redirect_to user_path(car.user)
    else
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(:user_id, :type_id, :model_year, :car_image, :manufacturer_id, :model_id)
  end
end