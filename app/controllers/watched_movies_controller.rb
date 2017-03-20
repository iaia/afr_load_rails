class WatchedMoviesController < ApplicationController
    before_action :set_watched_movie, only: [:update, :destroy]
    after_action :verify_authorized

    # GET /watched_movies
    # GET /watched_movies.json
    def index
        @watched_movies = WatchedMovie.where(user_id: @current_user.id)
        authorize @watched_movies
    end

    # POST /watched_movies
    # POST /watched_movies.json
    def create
        @watched_movie = WatchedMovie.new(watched_movie_params)
        @watched_movie.user_id = @current_user.id
        authorize @watched_movie

        respond_to do |format|
            if @watched_movie.save
                format.html { redirect_to @watched_movie, notice: 'Watched movie was successfully created.' }
                format.json { render :show, status: :created, location: @watched_movie }
                format.js {}
            else
                format.html { render :new }
                format.json { render json: @watched_movie.errors, status: :unprocessable_entity }
                format.js {}
            end
        end
    end

    # PATCH/PUT /watched_movies/1
    # PATCH/PUT /watched_movies/1.json
    def update
        @watched_movie.user_id = @current_user.id
        authorize @watched_movie
        respond_to do |format|
            if @watched_movie.update_attributes(update_watched_movie_params)
                format.html { redirect_to @watched_movie, notice: 'Watched movie was successfully updated.' }
                format.json { render :show, status: :ok, location: @watched_movie }
                format.js {}
            else
                format.html { render :edit }
                format.json { render json: @watched_movie.errors, status: :unprocessable_entity }
                format.js {}
            end
        end
    end

    # DELETE /watched_movies/1
    # DELETE /watched_movies/1.json
    def destroy
        authorize @watched_movie
        @watched_movie.destroy
        respond_to do |format|
            format.html { redirect_to watched_movies_url, notice: 'Watched movie was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_watched_movie
        @watched_movie = WatchedMovie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watched_movie_params
        params.fetch(:watched_movie, {}).permit(:movie_id, :watched, :watched_date)
    end

    def update_watched_movie_params
        params.fetch(:watched_movie, {}).permit(:watched, :watched_date)
    end
end
