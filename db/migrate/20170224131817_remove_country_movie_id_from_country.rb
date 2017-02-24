class RemoveCountryMovieIdFromCountry < ActiveRecord::Migration[5.0]
  def change
    remove_column :countries, :country_movie_id, :integer
  end
end
