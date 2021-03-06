class Movie < ActiveRecord::Base
  has_many :actor_movie
  has_many :actors, -> { distinct }, through: :actor_movie
  belongs_to :director
  has_many :countries, -> { distinct }, class_name: "MovieCountry"
  has_many :tv_programs, dependent: :delete_all
  has_one :watched, class_name: "WatchedMovie"

  has_many :thumbnails, -> { distinct }, class_name: "MovieThumbnail"
  accepts_nested_attributes_for :thumbnails
  accepts_nested_attributes_for :countries, allow_destroy: true, reject_if: :reject_blank_country

  validates :title, presence: true, allow_blank: false

  def reject_blank_country(attributes)
    exists = attributes[:id].present?
    empty = attributes[:country_code].blank?
    attributes.merge!(_destroy: 1) if exists && empty
    !exists && empty
  end

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

    movie.save!

    MovieCountry.create_from_task(movie, program.released_country)

    movie
  end

end
