class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_signup_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[email encrypted_password])
  end

  def configure_signup_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[role first_name last_name address phone_number post_code description])
  end
end
