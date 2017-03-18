class ActorsController < ApplicationController
    before_action :set_actor, only: [:show, :edit, :update]
    after_action :verify_authorized

    def index
        @actors = Actor.all
        authorize @actors
    end

    def show
        authorize @actor
    end

    def edit
        authorize @actor
    end

    def update
        authorize @actor
        if @actor.update_attributes(user_params)
            redirect_to @actor, notice: "saved"
        else
        end
    end

    private
    def set_actor
        @actor = Actor.find(params[:id])
    end
    def user_params
        params.require(:actor).permit(:name, :name_ja)
    end
end
