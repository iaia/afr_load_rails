class TvProgramController < ApplicationController
    before_action :nil_guard
    def index
        @programs = TvProgram.get_by(params[:year], params[:month])
    end

    def nil_guard
        @programs ||= []
    end
end
