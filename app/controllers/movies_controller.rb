class MoviesController < ApplicationController
    def show
        id = params[:id]
        @movie = Movie.find(id)
    end
end
