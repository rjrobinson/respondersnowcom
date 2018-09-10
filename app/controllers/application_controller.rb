class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!


  before_bugsnag_notify :add_user_info_to_bugsnag


  # before_action :set_user

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :name])
  end


  private

  def add_user_info_to_bugsnag(report)
    if current_user
      report.user = {
          email: current_user.email,
          name: current_user.name,
          id: current_user.id
      }
    end
  end


end