class TvProgram < ActiveRecord::Base
  belongs_to :movie
  has_one :watched, class_name: "WatchedTvProgram"
  has_one :recorded
  has_many :comments

  alias_attribute :oa_start, :on_air_start
  alias_attribute :oa_end, :on_air_end

  def self.get_by(date)
    TvProgram.where(on_air_date: date.beginning_of_month..date.end_of_month)
             .includes(%i[director leading_actor supporting_actor])
  end

  def start_time
    on_air_start
  end

  def end_time
    on_air_end
  end
end
