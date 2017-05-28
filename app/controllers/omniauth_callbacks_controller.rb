class OmniauthCallbacksController < ApplicationController
  def google_callback
    login(request.env["omniauth.auth"])
  end

  def twitter_callback
    login(request.env["omniauth.auth"])
  end

  def github_callback
    login(request.env["omniauth.auth"])
  end

  def facebook_callback
    login(request.env["omniauth.auth"])
  end

  private

  def login(auth)
    profile = SocialProfile.find_for_oauth(auth)
    session[:user_id] = profile.user.id

    redirect_to root_path
  end
end
