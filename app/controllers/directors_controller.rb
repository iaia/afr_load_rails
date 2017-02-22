class DirectorsController < ApplicationController
    def show
        id = params[:id]
        @director = Director.find(id)
    end
end
