class RemoveActorMovieIdFromActor < ActiveRecord::Migration[5.0]
  def change
    remove_column :actors, :actor_movie_id, :integer
  end
end
