class CommentsController < ApplicationController
  def index
    @tv = TvProgram.eager_load(:comments, comments: :contents)
      .order("comments.commented_time")
      .find(params[:tv_program_id].to_i)
  end
end
