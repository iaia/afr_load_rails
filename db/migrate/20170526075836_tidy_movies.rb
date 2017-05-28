class TidyMovies < ActiveRecord::Migration[5.0]
  def change
    change_table :movies do |t|
      t.remove :country_id
    end
  end
end
