class WatchedMovie < ApplicationRecord
    belongs_to :user
    belongs_to :movie
    validates :user_id,
        uniqueness: {scope: [:movie_id]}, on: :create
    validates :watched_date,
        presence: true, if: :watched
end
