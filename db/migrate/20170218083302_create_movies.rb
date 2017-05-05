class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :title_ja
      t.integer :director_id, null: false, default: 0
      t.integer :country_id, null: false, default: 0
      t.integer :released_year
      t.integer :released_country, null: false, default: 0

      t.timestamps null: false
    end
  end
end
