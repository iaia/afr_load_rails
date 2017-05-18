class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @users = User.all
    authorize @users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    authorize @user
  end

  # GET /users/new
  def new
    @user = User.new
    authorize @user
  end

  # GET /users/1/edit
  def edit
    authorize @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params_on_create)
    authorize @user

    respond_to do |format|
      if @user.save
        format.html do
          redirect_to @user, notice: "User was successfully created."
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json do
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to @user, notice: "User was successfully updated."
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json do
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html do
        redirect_to users_url, notice: "User was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
    @user.setting = UserSetting.new if @user.setting.nil?
  end

  def user_params_on_create
    params.require(:user).permit(:name, :nickname, setting_attributes: [:is_tweet, :is_post_on_facebook])
  end

  def user_params
    params.require(:user).permit(:nickname, setting_attributes: [:is_tweet, :is_post_on_facebook])
  end
end
