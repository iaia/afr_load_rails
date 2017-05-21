class RecordedsController < ApplicationController
  before_action :set_recorded, only: %i[show edit update destroy]
  after_action :verify_authorized

  # GET /recordeds
  # GET /recordeds.json
  def index
    @recordeds = Recorded.where(user_id: @current_user.id)
    authorize @recordeds
  end

  # GET /recordeds/1
  # GET /recordeds/1.json
  def show
    authorize @recorded
  end

  # GET /recordeds/new
  def new
    @recorded = Recorded.new
    authorize @recorded
  end

  # GET /recordeds/1/edit
  def edit
    authorize @recorded
  end

  # POST /recordeds
  # POST /recordeds.json
  def create
    @recorded = Recorded.new(recorded_params)
    authorize @recorded

    respond_to do |format|
      if @recorded.save
        format.html do
          redirect_to @recorded,
                      notice: "Recorded was successfully created."
        end
        format.js do
        end
      else
        format.html do
          render :new
        end
        format.js do
        end
      end
    end
  end

  # PATCH/PUT /recordeds/1
  # PATCH/PUT /recordeds/1.json
  def update
    authorize @recorded
    respond_to do |format|
      if @recorded.update_attributes(recorded_params)
        format.html do
          redirect_to @recorded,
                      notice: "Recorded was successfully updated."
        end
        format.js do
        end
      else
        format.html do
          render :edit
        end
        format.js do
        end
      end
    end
  end

  # DELETE /recordeds/1
  # DELETE /recordeds/1.json
  def destroy
    authorize @recorded
    @recorded.destroy
    respond_to do |format|
      format.html do
        redirect_to recordeds_url,
                    notice: "Recorded was successfully destroyed."
      end
      format.js do
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recorded
    @recorded = Recorded.find(params[:id])
    @recorded.user_id = @current_user.id
  end

  def recorded_params
    params.fetch(:recorded, {}).permit(
      :user_id, :tv_program_id, :recorded, :removed
    )
  end
end
