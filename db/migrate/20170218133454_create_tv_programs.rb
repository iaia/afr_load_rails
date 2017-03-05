class CreateTvPrograms < ActiveRecord::Migration
  def change
    create_table :tv_programs do |t|
      t.datetime :on_air_date
      t.string :title
      t.string :title_ja
      t.integer :director_id, null: false, default: 0
      t.integer :released_year
      t.integer :country_id, null: false, default: 0
      t.integer :leading_actor_id, null: false, default: 0
      t.integer :supporting_actor_id, null: false, default: 0
      t.integer :movie_id, null: false, default: 0

      t.timestamps null: false
    end
  end
end
