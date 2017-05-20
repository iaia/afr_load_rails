class CommentsController < ApplicationController
  def index
    @tv = TvProgram.includes(comments: :contents)
      .order("comments.commented_time")
      .find(params[:tv_program_id].to_i)
  end
end
