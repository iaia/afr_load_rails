class RecordedsController < ApplicationController
  before_action :set_recorded, only: [:show, :edit, :update, :destroy]

  # GET /recordeds
  # GET /recordeds.json
  def index
    @recordeds = Recorded.all
  end

  # GET /recordeds/1
  # GET /recordeds/1.json
  def show
  end

  # GET /recordeds/new
  def new
    @recorded = Recorded.new
  end

  # GET /recordeds/1/edit
  def edit
  end

  # POST /recordeds
  # POST /recordeds.json
  def create
    @recorded = Recorded.new(recorded_params)

    respond_to do |format|
      if @recorded.save
        format.html { redirect_to @recorded, notice: 'Recorded was successfully created.' }
        format.json { render :show, status: :created, location: @recorded }
        format.js {}
      else
        format.html { render :new }
        format.json { render json: @recorded.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /recordeds/1
  # PATCH/PUT /recordeds/1.json
  def update
    respond_to do |format|
      if @recorded.update_attributes(update_recorded_params)
        format.html { redirect_to @recorded, notice: 'Recorded was successfully updated.' }
        format.json { render :show, status: :ok, location: @recorded }
        format.js {}
      else
        format.html { render :edit }
        format.json { render json: @recorded.errors, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # DELETE /recordeds/1
  # DELETE /recordeds/1.json
  def destroy
    @recorded.destroy
    respond_to do |format|
      format.html { redirect_to recordeds_url, notice: 'Recorded was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recorded
      @recorded = Recorded.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recorded_params
      params.fetch(:recorded, {}).permit(:user_id, :tv_program_id, :recorded)
    end

    def update_recorded_params
      params.fetch(:recorded, {}).permit(:recorded, :removed)
    end
end
