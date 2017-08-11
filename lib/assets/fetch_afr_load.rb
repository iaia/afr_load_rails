# encoding: utf-8
require_relative "./afr_load_countries.rb"

class FetchAfrLoad
  def fetch
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      save_program(program)
    end
  end

  def save_program(program)
    director = Director.find_or_create_by(name_ja: program.movie_director)
    actors = add_by_actors(program)

    if program.released_country == "日本"
      program.title = program.title_ja
    end

    movie = Movie.find_or_initialize_by(
      title: program.title,
      director: director,
      released_year: program.released_year
    ) do |m|
      m.title_ja = program.title_ja
      m.actors = actors
      m.story = ""
    end

    return if movie.persisted?

    movie.save!

    AfrLoadCountries.find_country_by_names(program.released_country, "◆").each do |country|
      movie.countries.find_or_create_by(country_code: country.number)
    end

    add_tv_program(program, movie)
    Rails.application.config.fetch_afr_load_log.info("create #{program.values}")
  rescue
    Rails.application.config.fetch_afr_load_log.error("create error #{program.values}")
  end

  def add_by_actors(program)
    leading_actor =
      Actor.find_or_create_by(name_ja: program.leading_actor)
    supporting_actor =
      Actor.find_or_create_by(name_ja: program.supporting_actor)
    [leading_actor, supporting_actor]
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

  def write_log()
  end
end
