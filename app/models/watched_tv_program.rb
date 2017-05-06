class WatchedTvProgram < ApplicationRecord
  belongs_to :user
  belongs_to :tv_program
  validates :user_id,
            uniqueness: { scope: [:tv_program_id] }, on: :create
  validates :watched_date,
            presence: true, if: :watched

  after_initialize do
    self.watched_date ||= Time.current.to_s(:db)
  end

  def self.create_user_tvs(tvs, user)
    user = User.find(user.id)
    tvs.each do |tv|
      user.watched_tv_programs.find_or_create_by(tv_program_id: tv.id)
    end
  end
end
