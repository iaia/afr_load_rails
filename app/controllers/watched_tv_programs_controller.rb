class WatchedTvProgramsController < ApplicationController
    before_action :set_watched_tv_program, only: [:show, :edit, :update, :destroy]

    # GET /watched_tv_programs
    # GET /watched_tv_programs.json
    def index
        @watched_tv_programs = WatchedTvProgram.all
    end

    # GET /watched_tv_programs/1
    # GET /watched_tv_programs/1.json
    def show
    end

    # GET /watched_tv_programs/new
    def new
        @watched_tv_program = WatchedTvProgram.new
    end

    # GET /watched_tv_programs/1/edit
    def edit
    end

    # POST /watched_tv_programs
    # POST /watched_tv_programs.json
    def create
        @watched_tv_program = WatchedTvProgram.new(watched_tv_program_params)
        respond_to do |format|
            if @watched_tv_program.save
                format.html { redirect_to @watched_tv_program, notice: 'User was successfully created.' }
                format.json { render :show, status: :created, location: @watched_tv_program }
                format.js {}
            else
                format.html { render :new }
                format.json { render json: @watched_tv_program.errors, status: :unprocessable_entity }
                format.js {}
            end
        end
    end

    # PATCH/PUT /watched_tv_programs/1
    # PATCH/PUT /watched_tv_programs/1.json
    def update
        respond_to do |format|
            if @watched_tv_program.update_attributes(update_watched_tv_program_params)
                format.html { redirect_to @watched_tv_program, notice: 'Watched tv program was successfully updated.', layout: false }
                format.json { render :show, status: :ok, location: @watched_tv_program }
                format.js {}
            else
                format.html { render :edit }
                format.json { render json: @watched_tv_program.errors, status: :unprocessable_entity }
                format.js {}
            end
        end
    end

    # DELETE /watched_tv_programs/1
    # DELETE /watched_tv_programs/1.json
    def destroy
        @watched_tv_program.destroy
        respond_to do |format|
            format.html { redirect_to watched_tv_programs_url, notice: 'Watched tv program was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_watched_tv_program
        @watched_tv_program = WatchedTvProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def watched_tv_program_params
        params.fetch(:watched_tv_program, {}).permit(:user_id, :tv_program_id, :watched, :watched_date)
    end

    def update_watched_tv_program_params
        params.fetch(:watched_tv_program, {}).permit(:watched, :wathced_date)
    end
end
