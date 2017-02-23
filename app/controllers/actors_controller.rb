class ActorsController < ApplicationController
    def index
        @actors = Actor.all
    end

    def show
        id = params[:id]
        @actor = Actor.find(id)
    end
end
