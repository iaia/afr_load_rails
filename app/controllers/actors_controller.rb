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

  def update
    authorize @actor
    redirect_to @actor, notice: "saved" if @actor.update_attributes(user_params)
  end

  private

  def set_actor
    @actor = Actor.find(params[:id])
  end

  def user_params
    params.require(:actor).permit(:name, :name_ja)
  end
end
