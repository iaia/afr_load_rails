class DirectorsController < ApplicationController
    def index
        @directors = Director.all
    end

    def show
        @director = Director.find(params[:id])
    end

    def edit
        @director = Director.find(params[:id])
    end

    def update
        @director = Director.find(params[:id])
        if @director.update_attributes(user_params)
            redirect_to @director, notice: "saved"
        else
        end
    end

    private
    def user_params
        params.require(:director).permit(:name, :name_ja)
    end

end
