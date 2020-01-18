class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :email, :password, :password_confirmation, :profile_image_id, :introduction ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_image_id, :introduction])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
  end

end