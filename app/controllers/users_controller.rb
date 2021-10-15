class UsersController < ApplicationController
  def index
    @users.barbers = User.barber.all
  end

  def show
    @user.barber = User.barber.find(params[:id])
    render :show
  end

  private
  
  def user_params
    params.require(:require).permit()
  end
end
