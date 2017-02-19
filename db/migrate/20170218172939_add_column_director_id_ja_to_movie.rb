class AddColumnDirectorIdJaToMovie < ActiveRecord::Migration
    def change
        remove_column :movies, :director, :integer
        add_column :movies, :director_id, :integer, :after => :title_ja
        remove_column :movies, :released_country, :integer
        add_column :movies, :country_id, :integer
    end
end
