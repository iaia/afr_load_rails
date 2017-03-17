class User < ApplicationRecord
    has_many :watched_tv_programs
    has_many :watched_movies
    has_many :recordeds
    validates :name, presence: true, uniqueness: true,
        format: { with: /\A[a-z0-9_-]+\z/i }
    has_one :social_profile

    has_one :role

    def self.auth(name)
        User.find_by(name: name)
    end

end
