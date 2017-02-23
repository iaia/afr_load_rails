class DirectorsController < ApplicationController
    def index
        @directors = Director.all
    end

    def show
        id = params[:id]
        @director = Director.find(id)
    end
end
