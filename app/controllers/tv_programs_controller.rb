class TvProgramsController < ApplicationController
  before_action :nil_guard
  before_action :set_tv_program, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @start_date = self.class.make_year_and_month(params[:year], params[:month])
    @programs = TvProgram.get_by(@start_date)
    Recorded.create_user_tvs(@programs, @current_user) if @current_user
    authorize @programs
  end

  def destroy
    authorize @program
    @program.destroy
    respond_to do |format|
      format.html do
        redirect_to :back, notice: "Program was successfully destroyed."
      end
    end
  end

  def self.make_year_and_month(year, month)
    year = check_year(year)
    month = check_month(month)
    if year and month
      Date.new(year, month, 1)
    else
      Time.zone.today
    end
  end

  def self.check_year(year)
    year.to_i if year.to_i > 2000 and year.to_i < 2100
  rescue
  end

  def self.check_month(month)
    month.to_i if month.to_i >= 1 and month.to_i <= 12
  rescue
  end

  def nil_guard
    @programs ||= []
  end

  def set_tv_program
    @program = TvProgram.find(params[:id])
  end
end
