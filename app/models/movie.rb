class Movie < ActiveRecord::Base
  has_many :actor_movie
  has_many :actors, -> { distinct }, through: :actor_movie
  belongs_to :director
  has_many :countries, -> { distinct }, class_name: "MovieCountry"
  has_many :tv_programs, dependent: :delete_all
  has_one :watched, class_name: "WatchedMovie"
  has_many :thumbnails, -> { distinct }, class_name: "MovieThumbnail"

  validates :title, presence: true

end
