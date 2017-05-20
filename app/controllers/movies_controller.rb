class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update]
  after_action :verify_authorized

  def index
    @movies = Movie.includes(:director, :actors).order(:title_ja).all
    authorize @movies
  end

  def new
    @movie = Movie.new
    authorize @movie
  end

  def create
    @movie = Movie.new(movie_params_on_create)
    authorize @movie
    return

    respond_to do |format|
      if @movie.save
        format.html do
          redirect_to @movie, notice: "Movie was successfully created."
        end
      else
        format.html { render :new }
      end
    end
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
    redirect_to @movie, notice: "saved" if @movie.update_attributes(movie_params)
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :title_ja, :released_year)
  end

  def movie_params_on_create
    params.require(:movie).permit(
      :title, :title_ja,
      :director_id, :country_id,
      :released_year, :released_country_id,
      :story
    )
  end
end
