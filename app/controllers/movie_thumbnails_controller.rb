class MovieThumbnailsController < ApplicationController
  before_action :set_movie_thumbnail, only: [:show, :edit, :update, :destroy]

  # GET /movie_thumbnails
  # GET /movie_thumbnails.json
  def index
    @movie_thumbnails = MovieThumbnail.all
  end

  # GET /movie_thumbnails/1
  # GET /movie_thumbnails/1.json
  def show
  end

  # GET /movie_thumbnails/new
  def new
    @movie_thumbnail = MovieThumbnail.new
  end

  # GET /movie_thumbnails/1/edit
  def edit
  end

  # POST /movie_thumbnails
  # POST /movie_thumbnails.json
  def create
    @movie_thumbnail = MovieThumbnail.new(movie_thumbnail_params)

    respond_to do |format|
      if @movie_thumbnail.save
        format.html { redirect_to @movie_thumbnail, notice: 'Movie thumbnail was successfully created.' }
        format.json { render :show, status: :created, location: @movie_thumbnail }
      else
        format.html { render :new }
        format.json { render json: @movie_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_thumbnails/1
  # PATCH/PUT /movie_thumbnails/1.json
  def update
    respond_to do |format|
      if @movie_thumbnail.update(movie_thumbnail_params)
        format.html { redirect_to @movie_thumbnail, notice: 'Movie thumbnail was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie_thumbnail }
      else
        format.html { render :edit }
        format.json { render json: @movie_thumbnail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_thumbnails/1
  # DELETE /movie_thumbnails/1.json
  def destroy
    @movie_thumbnail.destroy
    respond_to do |format|
      format.html { redirect_to movie_thumbnails_url, notice: 'Movie thumbnail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_thumbnail
      @movie_thumbnail = MovieThumbnail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_thumbnail_params
      params.require(:movie_thumbnail).permit(:movie_id, :path, :file_size, :caption, :view_status, :status, :removed)
    end
end
