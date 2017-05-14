class CommentsController < ApplicationController
  def index
    @tv = TvProgram.includes(:comments, comments: :contents).find(params[:tv_program_id].to_i)
  end
end
