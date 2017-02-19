class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.integer :director_movie_id
      t.integer :released_year
      t.integer :released_country
      t.integer :actor_movie_id

      t.timestamps null: false
    end
  end
end
