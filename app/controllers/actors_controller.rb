class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end

    def show
        @actor = Actor.find(params[:id])
    end

    def edit
        @actor = Actor.find(params[:id])
    end

    def update
        @actor = Actor.find(params[:id])
        if @actor.update_attributes(user_params)
            redirect_to @actor, notice: "saved"
        else
        end
    end

    private
    def user_params
        params.require(:actor).permit(:name, :name_ja)
    end
end
