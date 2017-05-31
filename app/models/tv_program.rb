class TvProgram < ActiveRecord::Base
  belongs_to :movie
  has_one :watched, class_name: "WatchedTvProgram"
  has_one :recorded
  has_many :comments

  alias_attribute :oa_start, :on_air_start
  alias_attribute :oa_end, :on_air_end

  validates :movie, presence: true

  def self.get_by(date)
    TvProgram.includes(:movie).where(on_air_start: date.beginning_of_month..date.end_of_month)
  end

  def start_time
    on_air_start
  end

  def end_time
    on_air_end
  end
end
