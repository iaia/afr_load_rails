class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        if @movie.update_attributes(user_params)
            redirect_to @movie, notice: "saved"
        else
        end
    end

    private
    def user_params
        params.require(:movie).permit(:title, :title_ja, :released_year)
    end
end
