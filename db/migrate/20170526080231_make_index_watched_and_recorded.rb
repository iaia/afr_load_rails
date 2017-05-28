class MakeIndexWatchedAndRecorded < ActiveRecord::Migration[5.0]
  def change
    add_index :watched_movies, [:user_id, :movie_id], unique: true
    add_index :watched_tv_programs, [:user_id, :tv_program_id], unique: true
    add_index :recordeds, [:user_id, :tv_program_id], unique: true
  end
end
