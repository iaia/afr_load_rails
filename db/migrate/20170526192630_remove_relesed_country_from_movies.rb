class RemoveRelesedCountryFromMovies < ActiveRecord::Migration[5.0]
  def change
    remove_column :movies, :released_country, :integer, default: 0, null: false
    change_column :movies, :released_year, :integer, null:false, default: 1893
  end
end
