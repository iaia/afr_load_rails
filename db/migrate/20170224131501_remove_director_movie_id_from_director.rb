class RemoveDirectorMovieIdFromDirector < ActiveRecord::Migration[5.0]
  def change
    remove_column :directors, :director_movie_id, :integer
  end
end
