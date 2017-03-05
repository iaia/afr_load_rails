class CreateWatchedMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :watched_movies do |t|
      t.integer :user_id
      t.integer :movie_id
      t.boolean :watched, default: false, null: false
      t.datetime :watched_date

      t.timestamps
    end
  end
end
