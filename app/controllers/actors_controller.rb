class ActorsController < ApplicationController
  before_action :set_actor, only: %i[show edit update]
  after_action :verify_authorized

  def index
    @actors = Actor.all
    authorize @actors
  end

  def show
    authorize @actor
  end

  def edit
    authorize @actor
  end

  def new
    @actor = Actor.new
    authorize @actor
  end

  def create
    @actor = Actor.new(actor_params)
    authorize @actor
    return

    respond_to do |format|
      if @actor.save
        format.html do
          redirect_to @actor, notice: "Actor was successfully created."
        end
      else
        format.html { render :new }
      end
    end
  end

  def update
    authorize @actor
    redirect_to @actor, notice: "saved" if @actor.update_attributes(user_params)
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:name, :name_ja)
  end
end
