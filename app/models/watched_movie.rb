class WatchedMovie < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  validates :user_id,
            uniqueness: { scope: [:movie_id] }, on: :create
  validates :watched_date,
            presence: true, if: :watched

  def self.watched_by_tv_program(watched_tv)
    if watched_tv.watched
      WatchedMovie.find_or_create_by(
        user_id: watched_tv.user_id,
        movie_id: watched_tv.tv_program.movie.id,
        watched_date: watched_tv.watched_date,
        watched: true
      )
    end
  end
end
