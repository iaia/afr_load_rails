module Users
  class ApplicationPermissionsController < ApplicationController
    before_action :set_user, only: %i[assign]
    after_action :verify_authorized

    def index
      @users = User.includes(:setting).where(user_settings: {apply_editor_permission: true})
      authorize @users
    end

    # patch /application_permissions/assign/:user_id
    def assign
      authorize @user
      respond_to do |format|
        if @user.update(assign_params)
          format.html  { redirect_to edit_user_path(@user), status: :ok }
        else
          format.html  { redirect_to edit_user_path(@user), status: :bad_request }
        end
      end
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def assign_params
      params.require(:user).permit(:role_id)
    end

  end
end
