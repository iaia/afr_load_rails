class TvProgramsController < ApplicationController
    before_action :nil_guard
    def index
        @start_date = self.class.make_year_and_month(params[:year], params[:month])
        @programs = TvProgram.get_by(@start_date)
    end

    def self.make_year_and_month(year, month)
        year = check_year(year)
        month = check_month(month)
        if year and month
            Date.new(year, month, 1)
        else
            Date.today
        end
    end

    def self.check_year(year)
        if year.to_i > 2000 and year.to_i < 2100
            year.to_i
        end
    rescue
    end

    def self.check_month(month)
        if month.to_i >= 1 and month.to_i <= 12
            month = month.to_i
        end
    rescue
    end


    def nil_guard
        @programs ||= []
    end
end
