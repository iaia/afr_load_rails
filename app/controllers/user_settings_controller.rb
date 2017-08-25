class UserSettingsController < ApplicationController
  before_action :set_user, only: [:application_editor_permission, :update]

  # PATCH/PUT /users/1/application_editor_permission
  def application_editor_permission
    authorize @user.setting
    respond_to do |format|
      if @user.setting.update(setting_params)
        format.html  { redirect_to edit_user_path(@user), status: :ok }
      else
        format.html  { redirect_to edit_user_path(@user), status: :bad_request }
      end
    end
  end

  # PATCH/PUT /users/1/setting
  def update
    authorize @user
    respond_to do |format|
      if @user.setting.update(setting_params)
        format.html  { redirect_to edit_user_path(@user), status: :ok }
      else
        format.html  { redirect_to edit_user_path(@user), status: :bad_request }
      end
    end
  end

  def set_user
    @user = @current_user
    @user.setting ||= UserSetting.new
  end

  def application_editor_permission_params
    params.require(:user_setting).permit(:mail_address, :apply_editor_permission)
  end

  def setting_params
    params.require(:user_setting).permit(:mail_address, :apply_editor_permission)
  end
end
