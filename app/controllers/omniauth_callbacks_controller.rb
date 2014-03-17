class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    user = User.find_for_facebook_oauth(request.env["omniauth.auth"])

    if user.persisted?
      flash.notice = "Signed in Through Facebook!"
      sign_in_and_redirect user
    else
      session["devise.user_attributes"] = user.attributes
      flash.notice = "Problem creating account"
      redirect_to new_user_registration_url
    end
  end


end