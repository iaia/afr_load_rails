class AddColumnToTvProgram < ActiveRecord::Migration
    def change
        remove_column :tv_programs, :on_air_date, :date
        add_column :tv_programs, :on_air_date, :datetime
        remove_column :tv_programs, :released_country, :integer
        add_column :tv_programs, :country_id, :integer
        remove_column :tv_programs, :leading_actor, :integer
        add_column :tv_programs, :leading_actor_id, :integer
        remove_column :tv_programs, :supporting_actor, :integer
        add_column :tv_programs, :supporting_actor_id, :integer
        remove_column :tv_programs, :director, :integer
        add_column :tv_programs, :director_id, :integer
    end
end
