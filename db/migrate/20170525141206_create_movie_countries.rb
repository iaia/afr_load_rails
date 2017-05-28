class CreateMovieCountries < ActiveRecord::Migration[5.0]
  def change
    create_table :movie_countries do |t|

      t.integer :movie_id, null: false
      t.string :country_code, null: false

      t.timestamps
    end
  end
end
