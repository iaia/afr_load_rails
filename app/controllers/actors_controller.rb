class ActorsController < ApplicationController
    def show
        id = params[:id]
        @actor = Actor.find(id)
    end
end
