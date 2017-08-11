# encoding: utf-8

class FetchAfrLoad
  def fetch
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      program = adjust(program)
      save_program(program)
    end
  end
  
  def adjust(program)
    if program.released_country == "日本"
      program.title = program.title_ja
    end
    program.on_air_start = convert_ja_time(program.on_air_start)
    program.on_air_end = convert_ja_time(program.on_air_end)
  end

  def save_program(program)
    movie = Movie.create_from_task(program)
    return if movie.nil?
    TvProgram.create_from_task(program, movie)
    Rails.application.config.fetch_afr_load_log.info("create #{program.values}")
  rescue
    Rails.application.config.fetch_afr_load_log.error("create error #{program.values}")
  end

  private
  def convert_ja_time(time)
    return DateTime.strptime(time, "%Y%m%d%H%M%S")
      .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
  end
end
