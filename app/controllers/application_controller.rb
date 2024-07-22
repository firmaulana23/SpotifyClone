class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :email, :username, :first_name, :last_name, :address, :dob, :sex
    ])
    devise_parameter_sanitizer.permit(:account_update, keys: [
      :email, :username, :first_name, :last_name, :address, :dob, :sex
    ])
  end
end
