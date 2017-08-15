class MovieThumbnailsController < ApplicationController
  before_action :set_movie_thumbnail, only: %i[show edit update destroy]

  # GET /movie_thumbnails
  # GET /movie_thumbnails.json
  def index
    @movie_thumbnails = MovieThumbnail.all
  end

  # GET /movie_thumbnails/1
  # GET /movie_thumbnails/1.json
  def show; end

  # GET /movie_thumbnails/1/edit
  def edit; end

  # POST /movie_thumbnails
  # POST /movie_thumbnails.json
  def create
    params[:movie_thumbnail][:image] = params[:file]
    @movie_thumbnail = MovieThumbnail.new(movie_thumbnail_params)

    respond_to do |format|
      if @movie_thumbnail.save
        format.html do
          redirect_to @movie_thumbnail,
                      notice: "Movie thumbnail was successfully created."
        end
        format.json do
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /movie_thumbnails/1
  # PATCH/PUT /movie_thumbnails/1.json
  def update
    respond_to do |format|
      if @movie_thumbnail.update(movie_thumbnail_params)
        format.html do
          redirect_to @movie_thumbnail,
                      notice: "Movie thumbnail was successfully updated."
        end
      else
        format.html do
          render :edit
        end
      end
    end
  end

  # DELETE /movie_thumbnails/1
  # DELETE /movie_thumbnails/1.json
  def destroy
    @movie_thumbnail.destroy
    respond_to do |format|
      format.html do
        redirect_to movie_thumbnails_url,
                    notice: "Movie thumbnail was successfully destroyed."
      end
      format.json do
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_movie_thumbnail
    @movie_thumbnail = MovieThumbnail.find(params[:id])
  end

  def create_params
    params.require(:movie_thumbnail).permit(
      :movie_id, :image
    )
  end

  def movie_thumbnail_params
    params.require(:movie_thumbnail).permit(
      :movie_id, :image
    )
  end
end
