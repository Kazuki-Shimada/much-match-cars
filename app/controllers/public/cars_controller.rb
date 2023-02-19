class Public::CarsController < ApplicationController
  def show
  end

  def new
    @car = Car.new
  end

  def edit
  end
  def create
    car = Car.new(car_params)
    car.user_id = current_user.id
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

  private

  def car_params
    params.require(:car).permit(:user_id, :type_id, :model_year, :car_image)
  end
end
