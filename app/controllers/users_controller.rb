class UsersController < ApplicationController
  def index
    @barbers = User.where(role: "barber")
  end

  def show
    @barber = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    authorize @user
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :role, :email, :photo)
  end
end
