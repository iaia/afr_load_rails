class MovieCountry < ApplicationRecord
  belongs_to :movie
  validates :movie_id, uniqueness: {scope: [:country_code]}

  def name
    c = ISO3166::Country.find_country_by_number(self.country_code)
    return "" if c.nil?
    c.local_name
  end

  def self.create_from_task(movie, countries)
    AfrLoadCountries::Country.find_country_by_names(countries, delimiter: "◆").each do |country|
      movie.countries.find_or_create_by(country_code: country.number)
    end
  end
end
