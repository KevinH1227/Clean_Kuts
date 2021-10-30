class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.all
    @barbers = User.where(role: "barber")

    @markers = @users.geocoded.map do |barber|
      {
        lat: barber.latitude,
        lng: barber.longitude,
        # info_window: render_to_string(partial: "info_window", locals: { barber: barber })
      }
    end
  end
end
