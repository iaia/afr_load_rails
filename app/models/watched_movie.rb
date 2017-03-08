class WatchedMovie < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    validates :user_id,
        uniqueness: {scope: [:movie_id]}, on: :create
    validates :watched_date,
        presence: true, if: :watched

    def self.watched_by_tv_program(watched_tv)
        watched_movie = WatchedMovie.find_or_create_by(user_id: watched_tv.user_id, movie_id: watched_tv.tv_program.movie.id, watched: true)
    end
end
