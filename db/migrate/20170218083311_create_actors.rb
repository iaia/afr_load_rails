class CreateActors < ActiveRecord::Migration
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :actor_movie_id

      t.timestamps null: false
    end
  end
end
