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
    TvProgram.add(program, movie)
  end
end
