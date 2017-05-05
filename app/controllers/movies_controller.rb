class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update]
  after_action :verify_authorized

  def index
    @movies = Movie.all
    authorize @movies
  end

  def show
    if @current_user
      @watched = @current_user.watched_movies
                              .find_or_initialize_by(movie_id: @movie.id)
    end
    authorize @movie
  end

  def edit
    authorize @movie
  end

  def update
    authorize @movie
    redirect_to @movie, notice: "saved" if @movie.update_attributes(user_params)
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def user_params
    params.require(:movie).permit(:title, :title_ja, :released_year)
  end
end
