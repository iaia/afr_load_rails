class ChangeColumnToMovie < ActiveRecord::Migration
    def change
        change_column :movies, :director_id, :integer, null: false, default: 0
        change_column :movies, :country_id, :integer, null: false, default: 0
        change_column :movies, :actor_movie_id, :integer, null: false, default: 0
    end
end
