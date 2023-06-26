class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @cars = Car.where(user_id: @user.id)
    @count = 0
  end

  def index
    @users = User.all.page(params[:page]).per(10)
  end

  def edit
    @user = User.find(params[:id])
  end
  def confirm
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :profile_image, :introduct)
    end
    def is_matching_login_user
      user_id = params[:id].to_i
      unless user_id == current_user.id
        redirect_to root_path
      end
    end
end
