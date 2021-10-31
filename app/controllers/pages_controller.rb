class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @address = current_user.nil? ? "Montreal" : current_user.address
    # if User.barber.size > 4
    #   @barbers = User.near(@address, 1000).where(role: User.roles[:barber]).first(5)
      @barbers = User.where(role:'barber').near(@address, 100)
    # else
    #   @barbers = User.where(role: "barber")
    # end
    # @barbers = User.where(role: "barber")
    # @barber = User.find(params[:id])
    @markers = @barbers.geocoded.map do |barber|
      {
        lat: barber.latitude,
        lng: barber.longitude,
        info_window: render_to_string(partial: "info_window", locals: { barber: barber })
      }
    end
  end
end
