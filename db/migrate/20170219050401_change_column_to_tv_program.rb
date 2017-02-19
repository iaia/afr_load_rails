class ChangeColumnToTvProgram < ActiveRecord::Migration
    def change
        change_column :tv_programs, :director_id, :integer, null: false, default: 0
        change_column :tv_programs, :country_id, :integer, null: false, default: 0
        change_column :tv_programs, :leading_actor_id, :integer, null: false, default: 0
        change_column :tv_programs, :supporting_actor_id, :integer, null: false, default: 0
        change_column :tv_programs, :movie_id, :integer, null: false, default: 0
    end
end
