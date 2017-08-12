# encoding: utf-8

class FetchAfrLoad
  attr_reader :program
  def initialize(program)
    @program = program
    adjust
  end

  def adjust
    if @program.released_country == "日本"
      @program.title = @program.title_ja
    end
    @program.on_air_start = convert_ja_time(@program.on_air_start)
    @program.on_air_end = convert_ja_time(@program.on_air_end)
  end

  def save_program
    movie = Movie.create_from_task(@program)
    return if movie.nil?
    TvProgram.create_from_task(movie, @program)
    Rails.application.config.fetch_afr_load_log.error("create done")
  rescue => e
    err_message = "create error #{e.message}"
    Rails.application.config.fetch_afr_load_log.error(err_message)
    puts err_message
  end

  private
  def convert_ja_time(time)
    return DateTime.strptime(time, "%Y%m%d%H%M%S")
      .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
  end
end
