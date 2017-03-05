class SessionsController < ApplicationController
    def new
    end

    # login
    def create
        user = User.auth(params[:sessions][:name])
        if user
            session[:user_id] = user.id
        end
        redirect_to :root
    end

    # logout
    def destroy
        session[:user_id] = nil
        redirect_to :root
    end

end
