class AddColumnToMovie < ActiveRecord::Migration
    def change

        remove_column :movies, :director_movie_id, :integer
        add_column :movies, :director, :integer, :after => :title
    end
end
