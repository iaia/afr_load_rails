class CreateTvPrograms < ActiveRecord::Migration
  def change
    create_table :tv_programs do |t|
      t.date :on_air_date
      t.string :title
      t.string :title_ja
      t.integer :director
      t.integer :released_year
      t.integer :released_country
      t.integer :leading_actor
      t.integer :supporting_actor
      t.string :movie_id

      t.timestamps null: false
    end
  end
end
