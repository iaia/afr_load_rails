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

  def failure
    redirect_to :root
  end
end
