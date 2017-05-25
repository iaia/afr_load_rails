# encoding: utf-8

class FetchAfrLoad
  def fetch
    programs = AfrLoad::AfrLoad.get_schedule
    programs.each do |program|
      director = Director.find_or_create_by(name_ja: program.movie_director)
      actors = Actor.add_by_tv_program(program)
      movie = Movie.find_or_create_by(
        title: program.title,# title_ja: program.title_ja,
        director: director, released_year: program.released_year
      ) do |m|
        m.title_ja = program.title_ja
        m.actors.find_or_create_by(actors)
        m.story = ""
      end
      MovieCountry.split_and_create(movie, program.released_country)
      add_tv_program(program, movie)
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
      on_air_end: program.on_air_end,
      on_air_date: make_date_type(program.on_air_date),
      released_year: program.released_year
    )
  end

  def make_date_type(on_air_date)
    # 月/日[曜日]の形
    # とりあえず今月の+-1ヶ月分しか見えないはず
    # 今月の-+=で年月日は分かる
    now = Time.zone.now
    on_air_time = parse_on_air_date(now.year, on_air_date)

    if (on_air_time - now).to_i > 6 * 31 * 24 * 60 * 60
      on_air_time.year - 1
    elsif (on_air_time - now).to_i < -1 * 6 * 31 * 24 * 60 * 60
      on_air_time.year + 1
    else
      on_air_time
    end
  end

  def parse_on_air_date(year, on_air_date)
    on_air_month = on_air_date.match(/(.*)\//)[1]
    on_air_day = on_air_date.match(/.*\/(.*)\[.*\]/)[1]
    Time.zone.local(year, on_air_month, on_air_day)
  end
end
