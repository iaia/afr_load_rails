class CreateDirectors < ActiveRecord::Migration
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :director_movie_id

      t.timestamps null: false
    end
  end
end
