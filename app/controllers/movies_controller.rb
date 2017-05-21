class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
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
    @movie = Movie.new(movie_params)
    authorize @movie

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

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @movie
    @movie.destroy
    respond_to do |format|
      format.html do
        redirect_to movies_url, notice: "Movie was successfully destroyed."
      end
    end
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(
      :title, :title_ja,
      :director_id, :country_id,
      :released_year, :released_country_id,
      :story
    )
  end
end
