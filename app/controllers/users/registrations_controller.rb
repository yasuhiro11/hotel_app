# app/controllers/users/registrations_controller.rb
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :profile, :profile_image ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :name, :profile, :profile_image ])
  end
end
