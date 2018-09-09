class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :authenticate_user!

  # before_action :set_user

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :name])
  end


  # def set_user
  #   if !current_user && Rails.env.development?
  #     @user = User.first
  #     sign_in_and_redirect @user, event: :authentication #this will throw if @responder is not activated
  #   end
  # end

end