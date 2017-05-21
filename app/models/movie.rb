class Movie < ActiveRecord::Base
  has_many :actor_movie
  has_many :actors, -> { distinct }, through: :actor_movie
  belongs_to :director
  belongs_to :country
  has_many :tv_programs
  has_one :watched, class_name: "WatchedMovie"
  has_many :thumbnails, -> { distinct }, class_name: "MovieThumbnail"

  def self.add_by_tv_program(program)
    # 先にdirector, country, actorを作成
    country = Country.add_by_tv_program(program)
    director = Director.add_by_tv_program(program)
    # [leading_actor, supporting_actor]
    actors = Actor.add_by_tv_program(program)
    add(program.title, program.title_ja,
        director, program.released_year, country, actors
       )
  end

  def self.add(title, title_ja, director, year, country, actors)
    movie = Movie.find_or_create_by(
      title: title,
      director: director,
      released_year: year,
      released_country: country.id,
      country: country
    )
    movie.title_ja = title_ja
    movie.story = ""

    actors.each do |actor|
      movie.actors << actor
    end

    movie.save
    movie
  end

  def self.not_found(director, country, *actors)
    movie = Movie.new(
      title: "no title",
      title_ja: "no name",
      released_year: 9999,
      director: director,
      country: country
    )

    actors.each do |actor|
      movie.actors << actor
    end
    movie
  end
end
