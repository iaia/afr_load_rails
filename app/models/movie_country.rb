class MovieCountry < ApplicationRecord
  belongs_to :movies
  def self.split_and_create(movie, str, delimiter = "/")
    str.split(delimiter).each do |s|
      c = ISO3166::Country.find_country_by_name(s)
      if c.nil?
        c = Struct.new(:number).new(-1)
      end
      movie.countries.find_or_create_by(country_code: c.number)
    end
  end

  def name
    c = ISO3166::Country.find_country_by_number(self.country_code)
    return "" if c.nil?
    c.local_name
  end
end
