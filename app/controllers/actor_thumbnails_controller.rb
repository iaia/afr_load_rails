class ActorThumbnailsController < ApplicationController
  before_action :set_actor_thumbnail, only: %i[show edit update destroy]

  # GET /actor_thumbnails
  # GET /actor_thumbnails.json
  def index
    @actor_thumbnails = ActorThumbnail.all
  end

  # GET /actor_thumbnails/1
  # GET /actor_thumbnails/1.json
  def show; end

  # GET /actor_thumbnails/new
  def new
    @actor_thumbnail = ActorThumbnail.new
  end

  # GET /actor_thumbnails/1/edit
  def edit; end

  # POST /actor_thumbnails
  # POST /actor_thumbnails.json
  def create
    @actor_thumbnail = ActorThumbnail.new(actor_thumbnail_params)

    respond_to do |format|
      if @actor_thumbnail.save
        format.html do
          redirect_to @actor_thumbnail,
                      notice: "Actor thumbnail was successfully created."
        end
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /actor_thumbnails/1
  # PATCH/PUT /actor_thumbnails/1.json
  def update
    respond_to do |format|
      if @actor_thumbnail.update(actor_thumbnail_params)
        format.html do
          redirect_to @actor_thumbnail,
                      notice: "Actor thumbnail was successfully updated."
        end
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /actor_thumbnails/1
  # DELETE /actor_thumbnails/1.json
  def destroy
    @actor_thumbnail.destroy
    respond_to do |format|
      format.html do
        redirect_to actor_thumbnails_url,
                    notice: "Actor thumbnail was successfully destroyed."
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_actor_thumbnail
    @actor_thumbnail = ActorThumbnail.find(params[:id])
  end

  def actor_thumbnail_params
    params.require(:actor_thumbnail).permit(
      :actor_id, :path, :file_size, :caption, :view_status, :status, :removed
    )
  end
end
