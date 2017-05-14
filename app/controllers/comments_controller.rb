class CommentsController < ApplicationController
  def index
    @tv = TvProgram.find(params[:tv_program_id].to_i)
    @comments = @tv.comments#.order(commented_time: "DESC")
  end
end
