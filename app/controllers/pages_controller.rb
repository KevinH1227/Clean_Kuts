class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @address = current_user.address.nil? ? "Montreal" : current_user.address
    @barbers = User.where(role:'barber').near(@address, 100)
    @markers = @barbers.geocoded.map do |barber|
      {
        lat: barber.latitude,
        lng: barber.longitude,
        info_window: render_to_string(partial: "info_window", locals: { barber: barber })
      }
    end
  end
end
