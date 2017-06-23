class SessionsController < ApplicationController
  def new; end

  # login
  def create
    user = User.auth(params[:sessions][:name])
    session[:user_id] = user.id if user
    redirect_to :root
  end

  # logout
  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  def login_mobile
    credentials = "{\"token\":\"#{params[:token]}\""
    social = SocialProfile.where("credentials like '#{credentials}%'")
    session[:user_id] = social.first.user.id
    redirect_to :root
  end

  def failure
    redirect_to :root
  end
end
