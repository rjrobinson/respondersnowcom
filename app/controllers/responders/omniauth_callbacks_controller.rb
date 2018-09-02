class Responders::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @responder = Responder.from_omniauth(request.env['omniauth.auth'])

    if @responder.persisted?
      sign_in_and_redirect @responder, event: :authentication #this will throw if @responder is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      redirect_to new_responder_registration_url
    end
  end


  def google
    # TODO 
    # Add Google Login
  end

  def failure
    redirect_to root_path
  end
end