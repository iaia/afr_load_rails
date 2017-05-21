class DirectorsController < ApplicationController
  before_action :set_director, only: %i[show edit update]
  after_action :verify_authorized

  def index
    @directors = Director.all
    authorize @directors
  end

  def show
    authorize @director
  end

  def new
    @director = Director.new
    authorize @director
  end

  def create
    @director = Director.new(director_params_on_create)
    authorize @director

    respond_to do |format|
      if @director.save
        format.html do
          redirect_to @director, notice: "Director was successfully created."
        end
      else
        format.html { render :new }
      end
    end
  end

  def edit
    authorize @director
  end

  def update
    authorize @director
    if @director.update_attributes(user_params)
      redirect_to @director, notice: "saved"
    end
  end

  private

  def set_director
    @director = Director.find(params[:id])
  end

  def user_params
    params.require(:director).permit(:name, :name_ja)
  end

  def director_params_on_create
    params.require(:director).permit(
      :name, :name_ja,
    )
  end
end
