class UsersController < ApplicationController

  def index
    @users = User.all
  end
  # def barbers
  #   @barbers = Barber.all
  # end

  # def barber
  #   @barber = Barber.find(params[:id])
  #   render :barber
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :address, :phone_number, :role, :email)
  # end
end
