class Movie < ActiveRecord::Base
  has_many :actor_movie
  has_many :actors, -> { distinct }, through: :actor_movie
  belongs_to :director
  has_many :countries, -> { distinct }, class_name: "MovieCountry"
  has_many :tv_programs, dependent: :delete_all
  has_one :watched, class_name: "WatchedMovie"
  has_many :thumbnails, -> { distinct }, class_name: "MovieThumbnail"

  validates :title, presence: true, allow_blank: false

  def self.create_from_task(program)
    director = Director.find_or_create_by(name_ja: program.movie_director)
    actors = Actor.create_from_task(program.leading_actor, program.supporting_actor)

    movie = Movie.find_or_initialize_by(
      title: program.title,
      director: director,
      released_year: program.released_year
    ) do |m|
      m.title_ja = program.title_ja
      m.actors = actors
      m.story = ""
    end

    return nil if movie.persisted?

    movie.save!

    AfrLoadCountries.find_country_by_names(program.released_country, delimiter: "◆").each do |country|
      movie.countries.find_or_create_by(country_code: country.number)
    end
    movie
  end
end
