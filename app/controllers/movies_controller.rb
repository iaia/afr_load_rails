class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @movies = Movie.includes(:director, :actors).order(:title_ja).all
    authorize @movies
    respond_to do |format|
      format.html 
      format.json {render json: @movies}
    end
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
        format.html { render :new, status: :unprocessable_entity }
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
    respond_to do |format|
      if @movie.update(movie_params)
        format.html do
          redirect_to @movie, notice: "saved"
        end
      else
        format.html do
          render :edit, status: :unprocessable_entity
        end
      end
    end
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

  def title_search
    @movies = Movie.where("title LIKE(?)", "%#{params[:keyword]}%")
    skip_authorization
    render json: @movies
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
