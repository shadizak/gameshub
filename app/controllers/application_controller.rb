class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, alert: exception.message
  end
  # perform before_action only if the controller is devise_controller
  before_action :config_premitted_params, if: :devise_controller?
  protected

  # customize devise registration, add first_name and last_name to sign up
  def config_premitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

end
