# encoding: utf-8

class FetchAfrLoad
  def fetch
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      movie = add_or_find(program)
      add_tv_program(program, movie)
    end
  end

  def add_or_find(program)
    Movie.add_by_tv_program(program)
  end

  def add_tv_program(program, movie)
    program.on_air_start =
      (DateTime.strptime(program.on_air_start, "%Y%m%d%H%M%S"))
      .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
    program.on_air_end = 
      (DateTime.strptime(program.on_air_end, "%Y%m%d%H%M%S"))
      .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
    TvProgram.add(program, movie)
  end
end
