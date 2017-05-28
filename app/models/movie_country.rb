class MovieCountry < ApplicationRecord
  belongs_to :movies
  def name
    c = ISO3166::Country.find_country_by_number(self.country_code)
    return "" if c.nil?
    c.local_name
  end
end
