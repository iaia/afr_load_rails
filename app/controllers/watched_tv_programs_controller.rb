class WatchedTvProgramsController < ApplicationController
  before_action :set_watched_tv_program, only: %i[update destroy]
  after_action :verify_authorized

  # GET /watched_tv_programs
  # GET /watched_tv_programs.json
  def index
    @watched_tv_programs =
      WatchedTvProgram.where(user_id: @current_user.id)
    authorize @watched_tv_programs
  end

  # POST /watched_tv_programs
  # POST /watched_tv_programs.json
  def create
    @watched_tv_program =
      WatchedTvProgram.new(watched_tv_program_params)
    @watched_tv_program.user_id = @current_user.id
    authorize @watched_tv_program
    respond_to do |format|
      if @watched_tv_program.save
        WatchedMovie.watched_by_tv_program(@watched_tv_program)

        begin
          credentials = JSON.parse(@current_user.social_profile.credentials)
          client = Twitter::REST::Client.new do |config|
            config.consumer_key        = ENV["TWITTER_API_KEY"]
            config.consumer_secret     = ENV["TWITTER_API_SECRET"]
            config.access_token        = credentials["token"]
            config.access_token_secret = credentials["secret"]
          end
          debugger
          client.update("#{@watched_tv_program.tv_program.title_ja}を見ました https://afr-load.herokuapp.com/")
        rescue Exception => ex
          puts "failed to tweet... #{ex.message}"
        end

        format.html do
          redirect_to @watched_tv_program,
            notice: "User was successfully created."
        end
        format.json do
          render :show,
            status: :created, location: @watched_tv_program
        end
        format.js do
        end
      else
        format.html { render :new }
        format.json do
          render json: @watched_tv_program.errors,
            status: :unprocessable_entity
        end
        format.js do
        end
      end
    end
  end

  # PATCH/PUT /watched_tv_programs/1
  # PATCH/PUT /watched_tv_programs/1.json
  def update
    @watched_tv_program.user_id = @current_user.id
    authorize @watched_tv_program
    respond_to do |format|
      if @watched_tv_program.update_attributes(update_watched_tv_program_params)
        format.html do
          redirect_to @watched_tv_program,
            notice: "Watched tv program was successfully updated.",
            layout: false
        end
        format.json do
          render :show, status: :ok,
            location: @watched_tv_program
        end
        format.js do
        end
      else
        format.html { render :edit }
        format.json do
          render json: @watched_tv_program.errors,
            status: :unprocessable_entity
        end
        format.js do
        end
      end
    end
  end

  # DELETE /watched_tv_programs/1
  # DELETE /watched_tv_programs/1.json
  def destroy
    authorize @watched_tv_program
    @watched_tv_program.destroy
    respond_to do |format|
      format.html do
        redirect_to watched_tv_programs_url,
          notice: "Watched tv program was successfully destroyed."
      end
      format.json { head :no_content }
      format.js do
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_watched_tv_program
    @watched_tv_program = WatchedTvProgram.find(params[:id])
  end

  def watched_tv_program_params
    params.fetch(:watched_tv_program, {}).permit(
      :tv_program_id, :watched, :watched_date
    )
  end

  def update_watched_tv_program_params
    params.fetch(:watched_tv_program, {}).permit(
      :watched, :watched_date
    )
  end
end
