# encoding: utf-8

class FetchAfrLoad
  def fetch
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      director = Director.find_or_create_by(name_ja: program.movie_director)
      actors = add_by_actors(program)
      movie = Movie.find_or_create_by(
        title: program.title,
        director: director, released_year: program.released_year
      ) do |m|
        m.title_ja = program.title_ja
        m.actors = actors
        m.story = ""
      end

      split_and_create_country(movie, program.released_country)
      add_tv_program(program, movie)
    end
  end

  def add_by_actors(program)
    leading_actor =
      Actor.find_or_create_by(name_ja: program.leading_actor)
    supporting_actor =
      Actor.find_or_create_by(name_ja: program.supporting_actor)
    [leading_actor, supporting_actor]
  end

  def split_and_create_country(movie, str, delimiter = "/")
    str.split(delimiter).each do |s|
      if s == "アメリカ"
        s += "合衆国"
      end
      c = ISO3166::Country.find_country_by_name(s)
      if c.nil?
        c = Struct.new(:number).new("000")
      end
      movie.countries.find_or_create_by(country_code: c.number)
    end
  end

  def add_tv_program(program, movie)
    program.on_air_start =
      DateTime.strptime(program.on_air_start, "%Y%m%d%H%M%S")
    .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
    program.on_air_end =
      DateTime.strptime(program.on_air_end, "%Y%m%d%H%M%S")
    .in_time_zone("Asia/Tokyo") - 9 * 60 * 60
    TvProgram.find_or_create_by(
      movie: movie,
      on_air_start: program.on_air_start,
      on_air_end: program.on_air_end
    )
  end

end
