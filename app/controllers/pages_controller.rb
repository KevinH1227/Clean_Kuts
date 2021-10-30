class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @address = current_user.nil? ? "Montreal" : current_user.address
    if User.barber.size > 3
      @barbers = User.near(@address, 500).where(role: User.roles[:barber]).first(3)
    else
      @barbers = User.where(role: "barber")
    end
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
