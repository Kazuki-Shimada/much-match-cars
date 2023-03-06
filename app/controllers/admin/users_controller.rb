class Admin::UsersController < ApplicationController
  before_action :is_admin, only: [:show, :index]
  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to admin_users_path
    else
      render :show
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_deleted)
  end
  def is_admin
    unless admin_signed_in?
      redirect_to root_path
    end
  end
end
