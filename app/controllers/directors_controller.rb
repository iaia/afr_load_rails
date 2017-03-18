class DirectorsController < ApplicationController
    before_action :set_director, only: [:show, :edit, :update]
    after_action :verify_authorized

    def index
        @directors = Director.all
        authorize @directors
    end

    def show
        authorize @director
    end

    def edit
        authorize @director
    end

    def update
        authorize @director
        if @director.update_attributes(user_params)
            redirect_to @director, notice: "saved"
        else
        end
    end

    private
    def set_director
        @director = Director.find(params[:id])
    end

    def user_params
        params.require(:director).permit(:name, :name_ja)
    end

end
